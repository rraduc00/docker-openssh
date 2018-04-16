FROM ubuntu

# Installing software
RUN apt-get update
RUN apt-get -y install openssh-server fail2ban rsyslog sshfs expect rsync

# Creating test user
RUN useradd -d /home/test -m -s /bin/bash test
RUN echo "test:test" | chpasswd

# Creating ssh keys
RUN mkdir /home/test/.ssh
RUN touch /home/test/.ssh/authorized_keys
COPY ./Keys/id_rsa.pub /home/test/.ssh/
RUN cat /home/test/.ssh/id_rsa.pub > /home/test/.ssh/authorized_keys
RUN chmod 600 /home/test/.ssh/authorized_keys
RUN chown test:test /home/test/.ssh/authorized_keys

#Copying SFTP Backup Script into container
COPY ./sftpScript.sh /home/test
RUN chown test:test /home/test/sftpScript.sh
RUN chmod 755 /home/test/sftpScript.sh

#Copying RSYNC Backup Script into container
COPY ./rsyncScript.sh /home/test
RUN chown test:test /home/test/rsyncScript.sh
RUN chmod 755 /home/test/rsyncScript.sh

# Configuring fail2ban
COPY ./jail.local /etc/fail2ban/
RUN chmod 644 /etc/fail2ban/jail.local
RUN sed -i 's/port    = ssh/port    = 22/g' /etc/fail2ban/jail.conf # To prevent "invalid port/service `ssh' specified" error

# App
CMD rsyslogd && /etc/init.d/ssh start && /etc/init.d/fail2ban start && /bin/b ash



##### CRON CHEATSEET ####
####################################################################
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command to execute

# *	any value
# ,	value list separator
# -	range of values
# /	step values
# @yearly	(non-standard)
# @annually	(non-standard)
# @monthly	(non-standard)
# @weekly	(non-standard)
# @daily	(non-standard)
# @hourly	(non-standard)
# @reboot	(non-standard)


@reboot /home/test/baqupt.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd 
@reboot /home/test/rsyncBK.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd  

30 3 1 * * /home/test/baqupt.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd 
30 3 1 * * /home/test/rsyncBK.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd

15 2 * * 4 /home/test/baqupt.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd
15 2 * * 4 /home/test/rsyncBK.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd

0 */6 * * * /home/test/baqupt.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd
0 */6 * * * /home/test/rsyncBK.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd


Here's a one-liner that doesn't use/require the new job to be in a file:

(crontab -l 2>/dev/null; echo "*/5 * * * * /path/to/job -with args") | crontab -
The 2>/dev/null is important so that you don't get the no crontab for username message that some *nixes produce if there are currently no crontab entries.