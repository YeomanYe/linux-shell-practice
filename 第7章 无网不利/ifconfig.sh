#/bin/bash -xv


# 显示网络接口、子网掩码等详细信息
ifconfig
# 打印网络接口列表
ifconfig | cut -c-10 | tr -d ' ' | tr -s '\n'
# 显示特定网络接口的详细信息
ifconfig eth0
# 打印特定网络接口的IP地址
ifconfig eth0 | egrep -o "inet addr:[^ ]*" | grep -o "[0-9.]*"
# 设置IP地址和子网掩码
ifconfig eth0 192.168.0.80 netmask 255.255.252.0
# 手动修改硬件地址，在软件层面上进行硬件地址欺骗
ifconfig eth0 hw ether 00:1c:bf:87:25:d5

# 查看域名服务器
cat /etc/resolv.conf #nameserver 8.8.8.8

# 列出该域名所有的IP地址
host baidu.com

# nslookup类似于host的命令，用于查询DNS相关的细节信息以及名字解析。
nslookup google.com

# 不想经过DNS服务器可以在/etc/hosts中添加条目
cat /etc/hosts

# 显示路由表
route
# -n指定以数字形式显示地址
route -n
# 设置默认网关
route add default gw 192.168.1.1 eth0

# 打印两个ip连接经过的路由栈
traceroute google.com