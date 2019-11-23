#apt list | grep php7.0

chmod 777 *
docker build -t ubuntu:php70 . -f Dockerfile

docker run -it -p8080:80 -p3306:3306 ubuntu:php70 bash

#docker run -it --rm -p8080:80 -p3306:3306 ubuntu:v1 bash

#mysql -uroot -proot -e "use mysql;update user set host = '%' where user = 'root';"
#/etc/mysql/mysql.conf.d/mysqld.cnf
#docker run --rm -it 5788d62763be bash
#docker cp f8f154b5964a:/etc/mysql/mysql.conf.d/mysqld.cnf .
#curl ip.gs   mysql -h 49.234.70.72 -uroot -proot
