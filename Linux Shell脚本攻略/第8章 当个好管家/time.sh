#!/bin/bash -xv


: '
real时间指的是挂钟时间（wall clock time），也就是命令从开始执行到结束的时间。这段时间包括其他进程所占用的时间片（time slice）以及进程被阻塞时所花费的时间（例如，为等待I/O操作完成所用的时间）。 
user时间是指进程花费在用户模式（user-mode）中的CPU时间。这是唯一真正用于执行进程所花费的时间。执行其他进程以及花费在阻塞状态中的时间并没有计算在内。 
sys时间是指进程花费在内核模式（in the kernel）中的CPU时间。它代表在内核中执行系统调用所使用的时间，这和库代码（library code）不同，后者仍旧运行在用户空间（user space）。与“user时间”类似，这也是真正由进程使用的CPU时间。
'
# 统计命令执行的时间
time ls


: '
time命令的可执行二进制文件位于/usr/bin/time，还有一个Shell內建命令也叫做time。当运行time时，默认调用的是Shell的內建命令。Shell內建的time命令选项有限。因此，如果我们需要使用另外的功能，就应该使用可执行文件time的绝对路径（/usr/bin/time）。
'
# -o将命令执行时间写入文件
/usr/bin/time -o output.txt ls
# 将命令执行时间添加到文件而不影响其原有内容，使用-a以及-o
/usr/bin/time -ao output.txt ls

: '
格式化字符串输出
real -%e
user -%U
sys -%S
...
'
/usr/bin/time -f "Time:%U" ls
# 重定向执行时间信息与格式化输出
/usr/bin/time -f "Time:%U" uname > command_output.txt 2> time.log
