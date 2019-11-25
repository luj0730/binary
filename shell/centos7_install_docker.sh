echo "[+] 查看系统版本"
cat /etc/os-release

echo "[+] 安装依赖包"
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

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

docker pull centos:6
docker pull centos:7

docker pull php:5.6-apache mysql:5.7
