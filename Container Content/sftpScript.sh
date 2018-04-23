#!/bin/bash
#./sftpScript.sh lumn0 192.168.0.32:/home/lumn0/ttttt/asd
user=$1
password=$2
pathAndIp=$3

array=(${pathAndIp//:/ })
path=${array[1]}
ip=${array[0]}

expect<<EOD
spawn ssh -oStrictHostKeyChecking=no $user@$ip
expect "password: "
send "$password\r"
expect "$ "
send "mkdir -p $path\r"
expect "$ "
send "exit\r"
spawn sftp $user@$ip
expect "password:"
send "$password\n"
#expect "sftp>"
#send "mkdir -p $path\n"
expect "sftp>"
send "cd $path\n"
expect "sftp>"
send "put -r /home/*\n"
expect "sftp>"
send "exit\n"
interact