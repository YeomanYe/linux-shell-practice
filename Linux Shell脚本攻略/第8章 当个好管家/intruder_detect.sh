#!/bin/bash -xv


# 用途：入侵报告工具，以auth.log作为日志文件
: '
我们有一个通过SSH连接到Internet的系统。很多攻击者试图登入这个系统，因此需要编写shell脚本来设计一个入侵检测系统。入侵者被定义为：屡次试图登入系统达两分钟以上，并且期间的登录过程全部失败。凡是这类用户都应该被检测出来并生成包含以下细节信息的报告。 
试图登录的账户 
试图登录的次数 
攻击者的IP地址 
IP地址所对应的主机 
进行登录过程的时间段
'

AUTHLOG=/var/log/auth.log

if [[ -n $1 ]];then
    AUTHLOG=$1
    echo Using Log file : $AUTHLOG
fi
LOG=/tmp/valid.$$.log
grep -v "invalid" $AUTHLOG > $LOG
users=$(grep "Failed password" $LOG | awk '{print $(NF-5) }' | sort | uniq)

printf "%-5s|%-10s|%-10s|%-13s|%-33s|%s\n" "Sr#" "User" "Attempts" "IP address" "Host_Mapping" "Time range"

ucount=0;
ip_list="$(egrep -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" $LOG | sort | uniq)"

for ip in $ip_list;
do
    grep $ip $LOG > /tmp/temp.$$.log
    for user in $users;
    do
        grep $user /tmp/temp.$$.log> /tmp/$$.log
        cut -c-16 /tmp/$$.log > $$.time
        tstart=$(head -l $$.time);
        start=$(data -d "$tstart" "+%s");
        tend=$(tail -l $$.time);
        end=$(date -d "$time" "+%s")
        limit=$(( $end - $start))
        if [ $limit -gt 120 ];then
            let ucount++;
            IP=$(egrep -o "[0-9]+\.[0-9]+\.[0-9]+" /tmp/$$.log | head -1);
            TIME_RANGE="$tstart-->$tend"
            ATTEMPTS=$(cat /tmp/$$.log | wc -l);
            HOST=$(host $IP | awk '{print $NF}')
            printf "%-5s|%-10s|%-10s|%-10s|%-33s|%-s\n" "$ucount" "$user" "$ATTEMPTS" "$IP" "$HOST" "$TIME_RANGE"
        fi
    done
done
