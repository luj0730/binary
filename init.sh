docker run -it -p8080:80 -p2222:22 -p3307:3306 centos6/php56 bash

/etc/init.d/httpd start \
    && /etc/init.d/mysqld start \
    && mysql -uroot -proot -e "use mysql; grant all privileges  on *.* to root@'%' identified by 'root'; flush privileges;" \
    && /etc/init.d/mysqld restart \
    && yum install -y openssh-server \
    && tee /root/s <<-'EOF'
/etc/init.d/httpd restart && /etc/init.d/mysqld restart && /etc/init.d/sshd restart
EOF
chmod 777 /root/s 
