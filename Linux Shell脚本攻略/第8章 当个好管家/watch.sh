#!/bin/bash -xv

# 在终端以固定的间隔监视命令输出,默认2秒更行一次
watch 'ls -l | grep "^d"'
# 使用-n SECOND指定需要更新输出的时间间隔
watch -n 1 'ls -l'
# 命令输出差异以不同颜色突出标示出来
watch -d "ls -l"