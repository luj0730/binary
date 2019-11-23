dos2unix -k -o filename
yum install -y dos2unix


tee /root/debian/Dockerfile <<-'EOF'
FROM alpine:latest
ENV PACK=curl
RUN apk add --no-cache ${PACK} \
    && ${PACK} "ip.gs"

EOF

sed -i -e 's/\r$//' scriptname.sh


COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf

yum  provides */package-cleanup

apt-cache search netstat

git init .
git@github.com:sv4us/binary.git
git remote add origin git@github.com:sv4us/binary.git

本地测试
git init .
#添加分支
git branch test
#切换
git checkout  -b test
#切换到主分支
git checkout -b mster
#推送分支
git push origin test
#查看本地分支
git branch
#远程分支
git branch -r
#删除本地分支
git branch -d test
#删除远程分支
git push origin :develop
#把原始.git复制到新目录
