#!/bin/bash
#./rsyncScript.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd
user=$1
ipypath=$2

array=(${ipypath//:/ })
ruto=${array[1]}
ip=${array[0]}
echo  "contrasenia:"
read pass

expect<<END
spawn ssh $user@$ip
expect "password: "
send "$pass\r"
expect "$ "
send "mkdir -p $ruto\r"
expect "$ "
send "exit\r"

set timeout -1
spawn rsync -av -r -e ssh /home/ $user@$ip:$ruto
expect "password:"
send "$pass\r"
expect eof