#/bin/bash -xv

# 打印前10行
head filename
# 指定打印前几行
head -n 4 filename
# 打印除了最后N行之外所有的行
head -n -N filename

# 打印后10行
tail filename
# 指定打印后几行
tail -n 4 filename
# 打印除了前N行之外所有的行
tail -n +(N+1) filename
# 密切关注文件中新增加的内容
tail -f /var/log/messages

# 当进程结束时，tail命令随之结束
PID=$(pidof gedit)
tail -f file.txt --pid  $PID
