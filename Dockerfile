FROM ubuntu:22.04

# 制作者信息
LABEL auther_template="Randark_JMT"

# apt更新源，并安装socta用于端口转发
RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g" /etc/apt/sources.list && \
    sed -i "s/http:\/\/security.ubuntu.com/http:\/\/mirrors.ustc.edu.cn/g" /etc/apt/sources.list
    
RUN apt-get update && \
    apt-get install -y socat python3

RUN useradd -m ctf && echo "ctf:ctf" && \
    echo "ctf:ctf" | chpasswd

COPY ./service/docker-entrypoint.sh /

COPY ./src/getcap /usr/bin
COPY ./src/setcap /usr/bin

COPY ./src/preload.py /opt/python/preload.py

EXPOSE 9999
ENTRYPOINT ["/bin/bash","/docker-entrypoint.sh"]