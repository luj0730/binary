import socket
import socks
import requests

def proxy4s():
    socks.set_default_proxy(socks.SOCKS5, "127.0.0.1", 9011, username=None, password=None)
    socket.socket = socks.socksocket
    print(requests.get('http://www.baidu.com').text)

def proxy4req():
    headers = {
        'user-agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36'
    }
    proxies = {
        "http": "socks5://127.0.0.1:1086",
        'https': 'socks5://127.0.0.1:1086'
    }

    url = 'https://www.google.com/search?q=python'
    res = requests.get(url, headers=headers, proxies=proxies)
    print(res)

if __name__ == '__main__':
    #proxy4s()
    proxy4req()
    