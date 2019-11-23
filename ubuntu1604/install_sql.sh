apt-get install -y mysql-server mysql-client \
    net-tools tree zsh

/etc/init.d/mysql restart

mysql -uroot -proot -e "use mysql; grant all privileges  on *.* to root@'%' identified by 'root'; flush privileges;" \
    && /etc/init.d/mysql restart \
    && sed -i 's/bind-address/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf \
    && /etc/init.d/mysql restart \
    && /etc/init.d/php7.0-fpm stop \
    && /etc/init.d/php7.0-fpm start \
    && /etc/init.d/apache2 restart
