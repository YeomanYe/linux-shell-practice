#/bin/bash

: '
tput和stty是两款终端处理工具。下面来看看如何用它们完成各种不同的任务。
'

# 初始化终端
tput init

# 获取终端行数和列数
tput cols
tput lines

# 打印当前终端名
tput longname

# 移动光标到100,100处
tput cup 100 100

# 设置终端背景色,可以取0~7
tput setb 0
# 设置文本前景色,可以取0~7
tput setf 0

# 设置文本为粗体
tput bold

# 设置下划线的起止
tput smul
tput rmul

# 删错光标位置到行尾的所有内容:
tput ed

: '
stty
'
# 输入密码
echo -e "Enter password: "
# 关闭输入显示
stty -echo
read password
# 开启输入显示
stty echo
echo
echo Password read.