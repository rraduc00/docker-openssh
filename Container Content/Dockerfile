FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install fail2ban -y
#RUN apt-get install -y sudo

RUN mkdir /var/run/sshd
RUN mkdir /var/run/fail2ban

RUN useradd --create-home --shell /bin/bash test
RUN echo 'test:test' | chpasswd
# Uncomment the following line if you'd like to be able to use sudo with test user:
#RUN adduser test sudo # Allow test to use sudo

RUN ssh-keygen -A
ADD ./sshd_config /etc/ssh/sshd_config
ADD ./fail2ban/* /etc/fail2ban/
RUN touch /var/log/auth.log


RUN service fail2ban start

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]