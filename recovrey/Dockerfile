FROM alpine:latest
ENV PACK=curl
WORKDIR /root
COPY recovery.zip .
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories 

ENTRYPOINT [ "/bin/sh" ]
