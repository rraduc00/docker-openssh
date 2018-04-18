#!/bin/bash

(crontab -l 2>/dev/null; echo "@reboot sftpScript.sh <user> <password> <hostip>:<hostpathtosavecopy>") | crontab -
(crontab -l 2>/dev/null; echo "@reboot rsyncScript.sh <user> <password> <hostip>:<hostpathtosavecopy>") | crontab -

(crontab -l 2>/dev/null; echo "30 3 1 * * sftpScript.sh <user> <password> <hostip>:<hostpathtosavecopy>") | crontab -
(crontab -l 2>/dev/null; echo "30 3 1 * * rsyncScript.sh <user> <password> <hostip>:<hostpathtosavecopy>") | crontab -

(crontab -l 2>/dev/null; echo "15 2 * * 5 sftpScript.sh <user> <password> <hostip>:<hostpathtosavecopy>") | crontab -
(crontab -l 2>/dev/null; echo "15 2 * * 5 rsyncScript.sh <user> <password> <hostip>:<hostpathtosavecopy>") | crontab -

(crontab -l 2>/dev/null; echo "0 */6 * * 6,0 sftpScript.sh <user> <password> <hostip>:<hostpathtosavecopy>") | crontab -
(crontab -l 2>/dev/null; echo "0 */6 * * 6,0 rsyncScript.sh <user> <password> <hostip>:<hostpathtosavecopy>") | crontab -