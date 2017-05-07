#!/bin/bash -xv

# 使用ssh连接远程主机
ssh root@192.168.17.150
# 指定端口，默认端口为22
ssh user@localhost -p 422
# 在远程主机上运行一条命令，并退出远程主机
ssh user@remote_host "whoami"
# 执行多个命令
ssh root@192.168.17.150 "echo user: $(whoami);echo OS:$(uname)"

# 通过SSH计算系统运行的时间
IP_LIST="192.168.0.1 192.168.0.5 192.168.0.9"
USER="test"

for IP in $IP_LIST;
do
    utime=$(ssh $USER@$IP uptime | awk '{ print $3}')
    echo $IP uptime; $utime
done

# -C启用对数据进行压缩传输
ssh -C user@hostname COMMANDS
# 将数据重定向至远程shell命令的stdin
echo "text" | ssh user@remote_host 'cat >> list'
# 将文件中的数据重定向
ssh user@remote_host 'cat >> list' < file
