FROM alpine:latest
ENV PACK=curl

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache ${PACK} 

#ENTRYPOINT [ "curl", "-s", "https://ip.cn" ]
CMD [ "curl", "-s", "https://ip.cn" ]
