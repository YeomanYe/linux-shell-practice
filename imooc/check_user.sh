#!/bin/bash -xv

# 判断登录的用户是否是root
test=$(env | grep "USER" | cut -d "=" -f2)
if [ "$test" == root ];then
    echo "Current user is root."
else
    echo "Current user isn't root."
fi