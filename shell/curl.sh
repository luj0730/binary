# 使用账号密码访问代理
$curl -v  --socks5 127.0.0.1:9011  -U username:password http://www.baidu.com
# 无账号密码访问代理，DNS不通过代理
$curl -v  --socks5 127.0.0.1:9011  http://www.baidu.com
# 无账号密码访问代理，DNS通过代理
$curl -v  --proxy socks5h://127.0.0.1:9011  http://www.baidu.com

#header信息
$curl -i https://ip.cn

