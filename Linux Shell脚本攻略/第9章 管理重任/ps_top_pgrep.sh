#!/bin/bash -xv


# 打印进程的信息,-f显示更多的信息
ps -f
# -o可以设置显示的不同的参数,-e显示所有信息(-ax能达到相同的效果)
: '
pcpu cpu占用率
pid 进程ID
ppid 父进程ID
pmem 内存使用率
comm 可执行文件名
cmd 简单命令
user 启动进程的用户
nice 优先级
time 累计的CPU时间
etime 进程启动后度过的时间
tty  所关联的TTY设备
euid 有效用户ID
stat 进程状态
'
ps -eo comm,pcpu | head

# 根据参数对ps输出进行排序,-降序、+升序
ps -eo comm,pcpu --sort -pcpu,+comm | head
# 获取指定进程的PID
ps -C bash -o pid=

# -u指定有效用户，-U指定真实用户
ps -u root -U root -o user,pcpu

# -t使用tty过滤ps输出
ps -t pts/0 pts/1

# -L显示进程的线程的相关信息
: '
NLWP 进程的线程数量
NLP 是ps输出中每个线程条目的线程ID
'
ps -eLf


# 默认输出一个占用CPU最多的进程列表，并可以进行控制
top

# 获得特定命令的进程ID列表
pgrep bash
# 指定定界符
pgrep bash -d ";"
# 指定用户列表
pgrep -u root,slynux bash
# -c返回匹配的进程数量
pgrep -c bash

