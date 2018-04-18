FROM ubuntu

# Installing software
RUN apt-get update
RUN apt-get -y install openssh-server fail2ban rsyslog sshfs expect rsync cron

# Creating test user
RUN useradd -d /home/test -m -s /bin/bash test
RUN echo "test:test" | chpasswd

# Creating ssh keys
RUN mkdir /home/test/.ssh
RUN touch /home/test/.ssh/authorized_keys
COPY ./Keys/id_rsa.pub /home/test/.ssh/
RUN cat /home/test/.ssh/id_rsa.pub > /home/test/.ssh/authorized_keys
RUN chmod 600 /home/test/.ssh/authorized_keys
RUN chown test:test /home/test/.ssh
RUN chown test:test /home/test/.ssh/authorized_keys

# Copying SFTP Backup Script into container
COPY ./sftpScript.sh /bin/sftpScript.sh

# Copying RSYNC Backup Script into container
COPY ./rsyncScript.sh /bin/rsyncScript.sh

# Permissions for backup files
RUN chmod +x /bin/rsyncScript.sh /bin/sftpScript.sh

# Configuring fail2ban
COPY ./jail.local /etc/fail2ban/
RUN chmod 644 /etc/fail2ban/jail.local
RUN sed -i 's/port    = ssh/port    = 22/g' /etc/fail2ban/jail.conf # To prevent "invalid port/service `ssh' specified" error

# Copy crontab file into container
COPY ./BackupJob /var/spool/cron
RUN chmod 600 /var/spool/cron/BackupJob

# App
CMD rsyslogd && /etc/init.d/ssh start && /etc/init.d/fail2ban start && service cron start && /bin/bash 

