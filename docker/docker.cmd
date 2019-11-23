rem 下载镜像
docker pull ubuntu:16.04

rem 查看镜像
docker image ls

rem 启动,退出清除数据 IMAGE
docker run --rm -it ubuntu:16.04 bash

rem 启动,退出不清除数据 IMAGE
docker run -it ubuntu:16.04 bash
docker run ubuntu:16.04 /bin/sh -c "while true; do sleep 1; done"
docker run -d ubuntu:16.04 /usr/bin/tail -f /dev/null

rem 历史  CONTAINER
docker ps -a
docker start -i 2ed895c45e3d
rem 停止  CONTAINER
docker stop 2ed895c45e3d

rem 清除历史  CONTAINER
docker container rm a56c2a9d1842
docker container prune

rem 历史记录  IMAGE
docker history ubuntu:16.04

rem 日志  CONTAINER
docker logs 2ed895c45e3d

rem 备份  CONTAINER
docker commit -m "ubuntu v1" 2ed895c45e3d

rem 导入导出  IMAGE
docker save ubuntu:16.04 -o ubuntu-1604-v0.tar
cat ubuntu.16.04.tar |docker import - ubuntu

rem 导入导出  CONTAINER
docker export -o ubuntu-1604-v0.tar 2ed895c45e3d
docker import postgres-export.tar postgres:latest

rem docker import将container导入后会成为一个image

rem docker tag <LAYER ID> <IMAGE NAME>来回滚之前的层
rem docker images --tree
rem exported-imported的镜像会丢失所有的历史

rem docker save保存的是镜像（image），docker export保存的是容器（container）；
rem docker load用来载入镜像包，docker import用来载入容器包，但两者都会恢复为镜像；
rem docker load不能对载入的镜像重命名，而docker import可以为镜像指定新名称。

rem docker load必须要载入的是一个分层文件系统，而postgres-export.tar并不具有这样的结构，因此无法载入。
rem 而docker import仅仅是将tar包里面的文件复制进来，所以不管tar包里面的文件结构是怎样的，都可以载入进来，所以能够载入postgres-save.tar。但postgres-save.tar并不是一个有效的操作系统镜像，因此当我试图以改镜像启动容器时，容器并不能启动

docker save alpine:latest -o alpine.tar
docker image rm alpine:latest
docker import alpine.tar alpine:v1
rem docker run --rm -it alpine:v1 sh 失败
cat alpine.tar| docker load
rem docker run -it alpine:latest sh  成功
docker container rm 64690177a3a1
docker image rm alpine:latest



docker pull alpine:latest
docker run -it alpine:latest sh
docker export -o alpine.tar 74862c4dfb6c
docker container prune 
docker image rm alpine:latest
docker import alpine.tar alpine:v1 
docker run --rm -it alpine:v1 sh
