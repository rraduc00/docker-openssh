FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y sudo && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

RUN useradd --create-home --shell /bin/bash test
RUN echo 'test:test' | chpasswd
RUN adduser test sudo ## permisos de root

RUN ssh-keygen -A
ADD ./sshd_config /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]