#/bin/bash

# 获取字符串长度
var=1234567890

echo ${#var}
# 识别shell版本
echo $SHELL
# 只能在shell中使用，放在脚本中变成了文件名
echo $0

# 检测是否为超级用户
if [ $UID -ne 0 ];then
    echo Non root user. Please run as root
else 
    echo "Root user"
fi