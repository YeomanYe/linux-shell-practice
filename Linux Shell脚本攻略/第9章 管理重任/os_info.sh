#!/bin/bash -xv

# 当前系统主机名
hostname
uname -n
# 打印Linux内核版本、硬件架构等详细信息
uname -a
# 打印内核发行版本
uname -r
# 打印主机类型(32、64位系统查询)
uname -m

# 打印cpu相关信息
cat /proc/cpuinfo
# 获取处理器名称
cat /proc/cpuinfo | head -n 5 | tail -1

# 打印内存的详细信息
cat /proc/meminfo
# 打印系统可用内存总量
cat /proc/meminfo | head -1

# 列出系统分区信息
cat /proc/partitions
fdisk -l

# 获取系统详细信息
lshw