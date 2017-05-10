#!/bin/bash -xv


# 监视远程系统的磁盘使用情况
logfile="diskusage.log"
if [[ -n $1 ]];then
    logfile=$1
fi
if [ ! -e $logfile ];then
    printf "%-8s %-14s %-9s %-8s %-6s %-6s %-6s %s\n" "Date" "IP address" "Device" "Capacity" "Used" "Free" "Percent" "Status" > $logfile
fi

IP_LIST="127.0.0.1 0.0.0.0"
#提供远程主机IP地址列表
{
    for ip in $IP_LIST;
    do
        ssh root@$ip 'df -H' | grep ^/dev/ > /tmp/$$.df
        while read line;
        do
            cur_date=$(date +%D)
            printf "%-8s %-14s " $cur_date $ip
            echo $line | awk '{printf("%-9s %-8s %-6s %-6s %-8s",$1,$2,$3,$4,$5);}'
            pusg=$(echo $line | egrep -o "[0-9]+%")
            pusg=${pusg/\%/};
            if [ $pusg -lt 80 ];then
                echo SAFE
            else
                echo ALERT
            fi
        done< /tmp/$$.df
    done
} >> $logfile

: '
查看生成的日志文件
cat diskusage.log
'