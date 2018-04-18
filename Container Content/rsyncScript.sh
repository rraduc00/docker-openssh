#!/bin/bash
#./rsyncScript.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd
user=$1
password=$2
ipypath=$3

array=(${ipypath//:/ })
ruto=${array[1]}
ip=${array[0]}

expect<<END
spawn ssh -oStrictHostKeyChecking=no $user@$ip
expect "password: "
send "$password\r"
expect "$ "
send "mkdir -p $ruto\r"
expect "$ "
send "exit\r"

set timeout -1
spawn rsync -av -r -e ssh -oStrictHostKeyChecking=no /home/ $user@$ip:$ruto
expect "password:"
send "$password\r"
expect eof