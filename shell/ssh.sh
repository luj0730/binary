ssh root@192.168.22.130

scp -r -P Port remote_username@remote_ip:remote_folder local_file

/etc/init.d/sshd restart

# /etc/ssh/ssh_config
# ForwardX11Trusted yes
# DISPLAY=localhost:10.0
# 10代表 port_num - 6000 = 10 
# .0代表显示像素

#不用设置 forwardX11 yes
ssh -X oracle@192.168.8.88
