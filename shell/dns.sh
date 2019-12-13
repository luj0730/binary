echo -e "\n52.74.223.119 github.com
52.216.137.20 github-production-release-asset-2e65be.s3.amazonaws.com
52.216.205.107 s3-1-w.amazonaws.com" >> /etc/hosts && \
    apt install -y nscd && \
    service nscd start

echo "testing:" && \
    wget https://github.com/cmderdev/cmder/releases/download/v1.3.13/cmder.7z

