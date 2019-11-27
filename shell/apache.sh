cat /etc/httpd/conf/httpd.conf
useradd apache
#apache:apache
chsh -s /bin/bash {用户名}
sudo chgrp -R webmasters /var/www/html
sudo find /var/www/html -type d -exec chmod g=rwxs "{}" \;
sudo find /var/www/html -type f -exec chmod g=rw  "{}" \;

service apache2 reload
systemctl restart apache2

find / -name httpd.conf
find / -name apache2.conf
#Apache 将特定的扩展名解析成 PHP
# IfModule dir_module
# DirectoryIndex修改为DirectoryIndex index.php index.html
# fModule mime_module
# AddType application/x-httpd-php .php

/etc/init.d/apache2 restart



#####   VirtualHost #####
mkdir -p /data/www && \
    chmod -R 777 /data/www && \
    cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak && \
    sed -i '/#<Directory \/srv\/>/i\<Directory /data/www/>\n\tOptions Indexes FollowSymLinks\n\tAllowOverride All\n\tRequire all granted\n</Directory>' /etc/apache2/apache2.conf && \
    cp /etc/apache2/ports.conf /etc/apache2/ports.conf.bak && \
    sed -i '/^Listen/a\Listen 8081' /etc/apache2/ports.conf && \
    cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bak && \
    echo "<VirtualHost *:8081>
        ServerAdmin webmaster@localhost
        DocumentRoot /data/www

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined


</VirtualHost>
" >> /etc/apache2/sites-available/000-default.conf && \
    /etc/init.d/apache2 restart && \
    echo "<?php phpinfo(); ?>" > /data/www/index.php && \
    chmod 755 /data/www/index.php && \
    curl 127.0.0.1:8081
    
#####   VirtualHost #####
    

#sed '/#<Directory \/srv\/>/i\11111' /etc/apache2/apache2.conf
#sed '/#<Directory \/srv\/>/a\11111' /etc/apache2/apache2.conf

#sed '/#<Directory \/srv\/>/i\<Directory /data/www/>\n\tOptions Indexes FollowSymLinks\n\tAllowOverride All\n\tRequire all granted\n</Directory>' /etc/apache2/apache2.conf


# <Directory /data/www/>
#         Options Indexes FollowSymLinks
#         AllowOverride All
#         Require all granted
# </Directory>
# #<Directory /srv/>
# AccessFileName .htaccess

