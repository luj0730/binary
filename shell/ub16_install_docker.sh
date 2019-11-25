echo "[+] 查看系统版本"
cat /etc/os-release

cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \

    
echo "[+] 添加docker repo"
yum-config-manager \
    --add-repo \
    "https://mirrors.ustc.edu.cn/docker-ce/linux/centos/docker-ce.repo"

echo "[+] 安装docker"
yum makecache fast
yum install -y docker-ce docker-ce-cli containerd.io

echo "[+] 更新 Docker Hub 镜像"
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://gaoqf3rh.mirror.aliyuncs.com"]
}
EOF
# tee /etc/docker/daemon.json <<-'EOF'
# {
#     "registry-mirrors": [
#     "https://dockerhub.azk8s.cn",
#     "https://reg-mirror.qiniu.com"
#     ]
# }
# EOF

echo "[+] 启动 Docker CE"
systemctl daemon-reload
systemctl enable docker && systemctl restart docker

echo "[+] 测试 Docker"
docker run hello-world

# docker pull centos:6
# docker pull ubuntu:16.04
# docker pull php:5.6-apache mysql:5.7
