#!/bin/bash

# 批量添加指定数量的用户
read -p "Please input user name:" -t 30 name
read -p "Please input the number of users:" -t 30 num
read -p "Please input the password of users:" -t 30 pass

if [ -n "$name" -a -n "$num" -a -n "$pass" ];then
    y=$(echo $num | sed 's/[0-9]//g')
    if [ -z "$y"];then
        for ((i=1;i<=$num;i=i+1))
        do
            /usr/sbin/useradd $name$i & > /dev/null
            echo $pass | /usr/bin/passwd --stdin $name$i &> /dev/null
        done
    fi
fi

# 删除除了root和mysql以外的全部可登录的用户
for i in $(cat /etc/passwd | grep "/bin/bash" | grep -v "mysql" | grep -v "root" |  cut -d ":" -f1)
do
    userdel -r $i
done