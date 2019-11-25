#systemctl reboot -i
#################
#####   dd  #####
#################
dd if=/dev/zero  bs=1M count=10 of=1.img

####################
#####   hydra  #####
####################
hydra -l root -P pass.txt 192.168.18.140 mysql
medusa -h 192.168.18.140 -u root -P pass.txt -M mysql

######################
#######  mysql  ######
######################
mysql -uroot -proot -e "use mysql;	grant all privileges  on *.* to root@'%' identified by 'root';flush privileges; select host,user,password from user;"

