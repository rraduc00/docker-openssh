#!/bin/bash
#./sftpScript.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd
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
spawn sftp $user@$ip
expect "password:"
send "$pass\n"
#expect "sftp>"
#send "mkdir -p $ruto\n"
expect "sftp>"
send "cd $ruto\n"
expect "sftp>"
send "put -r /home/*\n"
expect "sftp>"
send "exit\n"
interact