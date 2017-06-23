#/bin/bash -xv

# tempfile只有在基于Debian的发布版中才能找到，如Ubuntu、Debian等
temp_file=$(tempfile)
echo $temp_file
# 使用随机数设置临时文件
temp_file="/tmp/file-$RANDOM"
echo $temp_file
# 使用进程ID设置临时文件名,$$会扩展成当前运行脚本的进程ID
temp_file="/tmp/var.$$"
echo $temp_file