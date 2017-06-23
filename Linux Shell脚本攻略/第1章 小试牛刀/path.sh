#/bin/bash

# 分行显示路径
echo $PATH | tr ':' '\n'
# 添加新路径
temp=$PATH
export PATH="$PATH:/home/usr/bin"
# 恢复路径
export PATH=$temp