#!/bin/bash -xv

# 查看命令所在位置
which ls
# 不仅返回命令的路径，还能够打印其对应的命令手册的位置以及命令源代码的路径
whereis ls
# 确定文件类型
file FILENAME
# 输出简短的描述信息
whatis ls
# 平均负载指的是: 1 分钟 、 5分钟 、 15分钟的
uptime