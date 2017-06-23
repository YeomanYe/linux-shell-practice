#!/bin/bash -xv

: '
信号是Linux中的一种进程间通信机制。我们可以使用特定的信号来中断进程。每一种信号都同一个整数值相关联。当进程接收到一个信号时，它会通过执行对应的信号处理程序（signalhandler）来进行响应。在shell脚本中同样可以发送、接收信号，并对其进行处理。KILL是用于终止进程的信号。像Ctrl+C、Ctrl+Z这种作业都属于信号。kill命令可用来向进程发送信号，而trap命令用来处理所接收的信号。
'
# 列出所有可用的信号
kill -l
# 默认发出TERM信号用于终止一个进程
kill PROCESS_ID_LIST
# 通过kill向进程发送指定的信号，SIGNAL要么是名称、要么是信号数
kill -s SIGNAL PID
# 杀死一个进程
kill -s SIGNAL PROCESS_ID
kill -9 PROCESS_ID


# 通过命令名终止进程
killall process_name
# 通过名称向进程发送信号
killall -s SIGNAL process_name
# 通过名称强行杀死进程
killall -9 process_name
# -i使用前进行确认
killall -i process_name
# 通过名称以及所属用户名指定进程
killall -u root process_name

# pkill与kill类似，不过默认情况下pkill接受的是进程名
pkill process_name
pkill -s SIGNAL process_name
