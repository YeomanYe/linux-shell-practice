#!/bin/bash -xv


# 检测磁盘使用率
rate=$(df -h | grep "/dev/sda3" | awk '{print $5}' | cut -d "%" -f1)

if [ $rate -ge 10];then
    echo "Warning! /dev/sda3 is full!"
fi