FROM ubuntu:20.10

RUN apt-get update && \
    apt-get install -y openssh-server openssh-client

RUN mkdir /var/run/sshd
RUN echo 'test:test' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#ChallengeResponseAuthentication no/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
