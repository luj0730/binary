FROM ubuntu:16.04

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y apt-transport-https \
    && apt-get install -y apache2 \
    && apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-curl php7.0-dev php7.0-fpm php7.0-gd php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-opcache php7.0-pgsql php7.0-readline php7.0-xml php-xdebug 
    
#&& apt-get install -y mysql-server mysql-client \
#    && apt-get install -y phpmyadmin

WORKDIR /var/www/html/
COPY --chown=www-data:www-data index.php .
COPY --chown=www-data:www-data info.php .

WORKDIR /root
COPY start.sh .
COPY install_sql.sh .
RUN chown -R www-data:www-data /var/www \
    && chmod 755 *.sh \
    && rm -fr /var/www/html/index.html 


#CMD [ "sh", "-c" ,"/root/start.sh" ]
EXPOSE 22 80 3306
