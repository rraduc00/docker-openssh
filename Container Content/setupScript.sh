#!/bin/bash

checkExecution() {
	if [ $? -eq 0 ];
		then
			echo -e "[X][X] --> OK\n"
		else
			echo -e "[X][X] --> ERROR"
			echo -e "[X][X] --> ABORTING"
			exit 1
	fi
} 

denyHosts=0

if [ ! -z "$1" ];
	then
		if [ "$1" == "-d" ];
			then
				echo -e "[X][X] --> Launching container with Denyhosts FW.\n"
				denyHosts=1
		fi
fi
if [ $denyHosts -eq 0 ];
	then
		echo -e "[X][X] --> Launching container with fail2ban FW.\n"
fi


# Generate all specified keys
echo "[X][X] --> GENERATING ALL SPECIFIED KEYS"
ssh-keygen -A
checkExecution

if [ $denyHosts -eq 0 ];
	then
		echo "[X][X] --> LAUNCHING FAIL2BAN SERVICE FIREWALL"
		service fail2ban start
		checkExecution
	else
		echo "[X][X] --> LAUNCHING DENYHOSTS SERVICE FIREWALL"
		#service denyhosts start
fi

# Launch OpenSSH deamon. With -D  sshd will not detach and does not become a daemon.
echo "[X][X] --> LAUNCHING OPENSSH DAEMON"
#/usr/sbin/sshd -D
/usr/sbin/sshd -D
checkExecution



echo "[X][X] --> EXECUTION FINISHED"