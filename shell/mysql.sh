######################
#######  mysql  ######
######################
mysql -uroot -proot -e "use mysql;	grant all privileges  on *.* to root@'%' identified by 'root';flush privileges; select host,user,password from user;"

mysqladmin -uroot -proot password 123456 
mysql -uroot -proot -e "use mysql;set password for root@localhost = password('root');"

#创建数据库
create |drop database name;
show create table table_name;
#选择数据库
use database name;
#显示表
show tables;
#表的详细描述 	
describe tablename;
#删除数据库前，有提示
mysqladmin drop databasename
#显示当前mysql版本和当前日期
select version(),current_date;

#删除授权
revoke all privileges on *.* from root@”%”;
delete from user where user=”root” and host=”%”;
flush privileges;

#创建一个用户custom在特定客户端it363.com登录，可访问特定数据库test
grant select, insert, update, delete, create,drop on test.* to custom@it363.com identified by 'root';

#备份数据库
mysqldump -h host -u root -p dbname > dbname_backup.sql
#恢复数据库
mysqladmin -uroot -proot dbname
mysqladmin -uroot -proot dbname < dbname_backup.sql
#只卸出建表指令
mysqladmin -uroot -proot -d databasename > a.sql
#只想卸出插入数据的sql命令，而不需要建表命令
mysqladmin -uroot -proot -t databasename > a.sql
#只想要数据，而不想要什么sql命令
mysqldump -T./ phptest driver

#多表查询语句
select id,username from mytable where id=1 order by desc;
#更新指定数据 
update mytable set username=’lisi’ where id=1 
order by id desc | asc    desc倒序  asc(从1-100)
#删除整个表中的信息
delete from table_name;
#删除表中指定条件的语句
delete from table_name where id=3;
#创建数据库用户
CREATE USER username1 identified BY 'root' , username2 IDENTIFIED BY 'root';
#将某个库中的某个表的控制权赋予某个用户
Grant all ON db_name.table_name TO user_name [ indentified by ‘password’ ];


###表结构的修改 
# 增加一个字段
alter table table_name add column (字段名 字段类型);
alter table table_name add column 字段名 字段类型 after 某字段； 
alter table table_name drop字段名; 
alter table table_name change 旧字段名 新字段名 新字段的类型; 
alter table table_name rename to new_table_name;
#此方法也会使表中的取号器(ID)从1开始 一次性清空表中的所有数据
truncate table table_name;
###运用实例
create table users (id int primary key auto_increment,nikename varchar(20) not null unique,password varchar(100) not null,address varchar(200), reg_date timestamp not null default CURRENT_TIMESTAMP);

insert into users (id,nikename,password,address) values (1,'lyh1','1234',null),(10,'lyh22','4321','湖北武汉'),(null,'lyh333','5678', '北京海淀');
select articles.id,articles.content,users.* from users,articles where users.id=10 and articles.userid=users.id order by articles.id desc;

#忘记密码
vim /etc/my.cnf
[mysqld]
skip-grant-tables
mysql -uroot -proot -e "update mysql.user set authentication_string=password('adminss33') where user='root' and Host = 'localhost';"
vim /etc/my.cnf
systemctl restart mysql

mysqld_safe --skip-grant-tables >/dev/null 2>&1 &
#稍等5秒钟
mysql -uroot mysql -e "update user set password = Password('adminss33') where User = 'root'; flush privileges;" && systemctl restart mysql


#####   slow_query_log   #####
cp /etc/mysql/my.cnf /etc/mysql/my.cnf.bak && \
    echo "[mysqld]" >> /etc/mysql/my.cnf && \
    echo "slow_query_log = ON" >> /etc/mysql/my.cnf && \
    echo "slow_query_log_file = /var/lib/mysql/ubuntu-slow.log" >> /etc/mysql/my.cnf && \
    echo "long_query_time = 0.001" >> /etc/mysql/my.cnf && \
    echo > /var/lib/mysql/ubuntu-slow.log && \
    chmod 777 /var/lib/mysql/ubuntu-slow.log && \
    /etc/init.d/mysql restart && \
    mysql -uroot -proot -e "show variables like 'slow_query%';" && \
    echo "tail -f /var/lib/mysql/ubuntu-slow.log" && \
    cat /var/lib/mysql/ubuntu-slow.log


echo > /var/lib/mysql/ubuntu-slow.log && \
    chmod 777 /var/lib/mysql/ubuntu-slow.log && \
    mysql -uroot -proot -e "set global slow_query_log='ON'; \
    set global slow_query_log_file='/var/lib/mysql/ubuntu-slow.log'; \
    set global long_query_time=1; \
    show variables like 'slow_query%';" && \
    echo "tail -f /var/lib/mysql/ubuntu-slow.log" && \
    cat /var/lib/mysql/ubuntu-slow.log

#####   #####   #####


#####   general_log   #####

echo > /var/lib/mysql/ubuntu.log && \
    chmod 777 /var/lib/mysql/ubuntu.log && \
    mysql -uroot -proot -e "set global general_log='ON'; \
    show variables like 'general_log%';" && \
    tail -f /var/lib/mysql/ubuntu.log 
    #echo "tail -f /var/lib/mysql/ubuntu.log" && \
    #cat /var/lib/mysql/ubuntu.log

echo > /var/lib/mysql/ubuntu.log && \
    chmod 777 /var/lib/mysql/ubuntu.log && \
    mysql -uroot -proot -e "set global general_log='ON'; \
    set global general_log_file='/var/lib/mysql/ubuntu.log'; \
    set global long_query_time=0.001; \
    show variables like 'general_log%';" && \
    echo "tail -f /var/lib/mysql/ubuntu.log" && \
    cat /var/lib/mysql/ubuntu.log

#####   #####   #####

