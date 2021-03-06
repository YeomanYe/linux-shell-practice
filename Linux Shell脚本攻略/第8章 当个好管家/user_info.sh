#!/bin/bash -xv


# 获取当前登录用户的相关信息
who
# 获取更为详细的信息
w

: '
TTY是与文本终端相关联的设备文件。当用户生成一个新终端时，对应的设备文件就会出现在/dev/中（例如/dev/pts/3）。可以通过输入并执行命令tty来获得当前终端的设备路径。
'
# 列出当前登录主机的用户列表，每个终端都会被显示出来，所以相同用户名可能被多次打印
users
# 只显示登录用户
users | tr ' ' '\n' | sort | uniq

# 查看系统已经通电运行了多长时间
uptime

# 获取前一次启动及用户登录会话信息
last
# 获取失败的登录会话信息
lastb
# 获取重启的会话信息
last reboot
# 获取单个用户登录的会话信息
last USER
# last命令一日志文件/var/log/wtmp作为输入日志数据，-f指定其他的日志文件
last -f /var/log/wtmp