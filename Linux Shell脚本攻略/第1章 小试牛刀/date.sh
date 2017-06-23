#/bin/bash

# 读取时间
date
# 打印纪元时
date +%s

# 将日期转换为纪元时
date --date "Thu Nov 18 08:07:21 IST 2010" +%s
date --date "2017年 04月 23日 星期日 18:47:05 CST" +%s

: '
参数说明:
星期: %a(Sat)，%A(Saturday)
月: %b,%B
日: %d,%D(固定格式日期 mm/dd/yy)
年: %y,%Y
小时: %H
分钟: %M
秒: %S
纳秒: %N
纪元时: %s
'

# 以指定格式显示日期
date "+%d/%B/%Y"
# 设置时间: date -s "21 June 2009"

: '
检查一组命令花费的时间
'
start=$(date +%s)
cat temp.sh
end=$(date +%s)
difference=$(( end-start ))
echo Time token to execute commands is $difference seconds.

: '
在脚本中生成延时
'
echo -n Count:
# 保存当前光标位置
tput sc

count=0
while true;
do
    if [ $count -lt 20 ];
    then let count++;
    sleep 1;
    # 恢复光标位置到sc
    tput rc
    # 清楚光标当前位置到末尾的数据
    tput ed
    echo -n $count;
else exit 0;
fi
done