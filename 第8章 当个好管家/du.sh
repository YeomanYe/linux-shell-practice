#!/bin/bash -xv

# 找出某个文件（或多个文件）占用的磁盘空间;默认以字节为单位
du file1 file2
# 递归显示目录及所有文件的磁盘使用情况
du -a directory
# 以更友好的方式打印齿盘占用情况
du -h filename
# -c显示统计
du -c file1 file2
# -s只输出合计数据
du -s /root

: '
以特定单位显示
-b 字节
-k KB
-m MB
-B BLOCK_SIZE 块(BLOCK_SIZE以字节为单位)
'
du -B 4 test.sh

# 排除
du --exclude "*.txt" directory
# 排除列表
du --exclude-from EXCLUDE.txt directory

: '
设置最大遍历深度
'
du --max-depth 2 directory
# -x使只能够对单个文件系统进行遍历，du -x /会将/mnt中的所有挂载点排除在磁盘使用统计之外。
du -x directory

# 找出/root目录中最大的5个文件
# 这种查找方式包括了子文件
du -ak /root | sort -nrk 1 | head -n 5
# 找出最大的文件不包括目录
find . -type f -exec du -k {} \; | sort -nrk 1 | head

# 磁盘可用空间信息
# -h以适合人类阅读信息展现出来
df -h