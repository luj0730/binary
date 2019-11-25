apt-get -y install selinux \
    && sestatus -v \
    && sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

#临时关闭 
setenforce 0
#关闭
/etc/selinux/config   
#SELINUX=enforcing改为SELINUX=disabled
