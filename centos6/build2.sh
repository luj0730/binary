chmod 777 *

#docker build -t centos:v1 . -f Dockerfile.v1
docker build --no-cache -t centos/php56:v1 . -f Dockerfile.v2
docker run --rm -it -p8080:80 -p3306:3306 centos/php56:v1 /bin/zsh