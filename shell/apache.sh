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

