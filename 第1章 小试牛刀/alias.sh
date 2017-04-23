#/bin/bash

# 别名设置,一次性
alias install='yum install'
# 永久
echo 'alias installl="yum install"' >> ~/.bashrc
# 移除1.从文件~/.bashrc中删除 2.使用unalias命令
# 用新别名代替旧别名,同时在backup目录中保留副本
alias rm='cp @ ～/backup; rm @'
# 对命令转义，使用命令本身而不是其别名
\rm temp.txt
