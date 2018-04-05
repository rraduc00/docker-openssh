FROM ubuntu:16.04

# Install openssh
RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install fail2ban -y

# Create directories
RUN mkdir /var/run/sshd
RUN mkdir /var/run/fail2ban

# Create test user
RUN useradd --create-home --shell /bin/bash test
RUN echo 'root:root' | chpasswd
RUN echo 'test:test' | chpasswd

# Uncomment the following lines if you'd like to be able to use sudo with test user:
#RUN apt-get install -y sudo
#RUN adduser test sudo # Allow test to use sudo

# Copy into container config files
ADD ./sshd_config /etc/ssh/sshd_config
ADD ./fail2ban/* /etc/fail2ban/
ADD ./jail.local /etc/fail2ban/
RUN chmod -R +rx /etc/fail2ban/
RUN touch /var/log/auth.log

# Copy into container configuration script and give it permission
ADD ./setupScript.sh /etc/containerConfig/setupScript.sh
RUN chmod 001 /etc/containerConfig/setupScript.sh 

# Expose ssh protocol
EXPOSE 22

# Run configuration script 
CMD ["/etc/containerConfig/setupScript.sh"] # Launching with fail2ban
# CMD ["/etc/containerConfig/setupScript.sh", "-d"] # Launching with denyhosts