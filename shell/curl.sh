# 使用账号密码访问代理
$curl -v  --socks5 127.0.0.1:9011  -U username:password http://www.baidu.com
# 无账号密码访问代理，DNS不通过代理
$curl -v  --socks5 127.0.0.1:9011  http://www.baidu.com
# 无账号密码访问代理，DNS通过代理
$curl -v  --proxy socks5h://127.0.0.1:9011  http://www.baidu.com

#header信息
$curl -i https://ip.cn


$curl -d="admin_name=admin&admin_pwd=ddd&act=do_login" "http://192.168.22.131/admin/login.php?act=login"
# http://192.168.22.131/admin/login.php?act=login
# admin_name=admin&admin_pwd=ddd&act=do_login
