#!/bin/bash -xv

# 用来监视目录访问的shell脚本
path=$1
: '
inotifywait需要安装inotify-tools才能使用
事件
access 读取文件
modify 内容修改
attrib 属性修改
move 移动
create 创建
delete 删除
open 打开
close 关闭
'
# -m表明要持续监视变化，-r允许采用递归形式监视目录，-e指定需要监视的事件列表，-q表示只打印所需要的信息
inotifywait -m -r -e create,move,delete $path -q