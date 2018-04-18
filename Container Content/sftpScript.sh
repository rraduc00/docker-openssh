#!/bin/bash
#./sftpScript.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd
user=$1
password=$2
ipypath=$3

array=(${ipypath//:/ })
ruto=${array[1]}
ip=${array[0]}

expect<<EOD
spawn ssh -oStrictHostKeyChecking=no $user@$ip
expect "password: "
send "$password\r"
expect "$ "
send "mkdir -p $ruto\r"
expect "$ "
send "exit\r"
spawn sftp $user@$ip
expect "password:"
send "$password\n"
#expect "sftp>"
#send "mkdir -p $ruto\n"
expect "sftp>"
send "cd $ruto\n"
expect "sftp>"
send "put -r /home/*\n"
expect "sftp>"
send "exit\n"
interact