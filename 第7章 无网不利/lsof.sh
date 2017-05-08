#!/bin/bash -xv

# 查看开放端口以及运行在端口上的服务的详细信息
lsof -i
# 列出本地主机当前的开放端口
lsof -i | grep ":[0-9]\+->" -o | grep "[0-9]\+" -o | sort | uniq
# 列出开放端口与服务号
netstat -tnp
