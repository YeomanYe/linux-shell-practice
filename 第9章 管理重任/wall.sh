#!/bin/bash -xv

# 向终端中所有的当前登录用户发送广播消息：
cat message | wall

: '
消息概要（message outline）会显示谁（哪个用户、哪台主机）发送了这则消息。如果其他用户发送了消息，只有在“写入消息” 选项启用的情况下该消息才会显示在当前终端中。在绝大多数发行版中，“写入消息”选项都是默认启用的。如果消息的发送者是超级用户，那么不管“写入消息”选项是否启用，消息都会显示出来。
'
# 允许写入消息
mesg y
# 禁止写入消息
mesg n

# 向指定用户记录的终端发送信息的脚本
USER=$1
devices=`ls /dev/pts/* -l | awk '{print $3,$10}' |grep $USER | awk '{print $2}'`
for dev in $devices;
do
    cat /dev/stdin > $dev
done