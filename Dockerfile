FROM ubuntu:14.10

RUN sed -i 's/^deb http:\/\/.*ubuntu\.com\/ubuntu/ deb http:\/\/old-releases.ubuntu.com\/ubuntu/' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y openssh-server openssh-client
