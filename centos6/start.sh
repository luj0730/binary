echo "start server ..."
/etc/init.d/httpd restart
/etc/init.d/php-fpm restart
/etc/init.d/mysqld restart
echo "enter bash ..."
#/bin/bash