#!/bin/bash -xv

# 为信号分配信号处理程序
function handler()
{
    echo Hey, received singal : SIGINT
}
echo My process ID is $$
trap 'handler' SIGINT
while true;
do
    sleep 1
done

: '
使用kill命令发送信号
kill -s SIGINT PROCESS_ID
'