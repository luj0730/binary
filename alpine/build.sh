chmod 777 *

docker build -t alpine:v1 . -f Dockerfile

docker run --rm alpine:v1
docker run --rm alpine:v1 curl -s https://ip.cn -i
#docker run --rm -it alpine:v1 sh

#Alpine 软件名字可以在
# https://pkgs.alpinelinux.org/packages
#echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
