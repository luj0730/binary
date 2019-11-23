FROM centos:6

ARG DB_PASS='root'
WORKDIR /var/www/html/

RUN rpm -Uvh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm \
    && yum list --enablerepo=remi --enablerepo=remi-php56 \
    && yum makecache \
    && yum install -y php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof php-fpm  \
    && yum install -y mysql mysql-server \
    && chkconfig mysqld on \
    && service mysqld start \
    && mysqladmin -uroot password ${DB_PASS} \
    && yum install -y httpd \
    && chkconfig httpd on \
    && service httpd start \
    && yum clean all
#mysql_secure_installation

COPY --chown=apache:apache index.php .
COPY --chown=apache:apache info.php .

RUN chown -R apache:apache /var/www

ENTRYPOINT [ "/root/start.sh" ]

EXPOSE 22 80 3306
