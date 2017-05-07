#/bin/bash -xv


: '
ping命令用于检测两台主机是否连通
'
# -c限制分组数量为2
ping 192.168.1.150 -c 2
# ping命令如果执行顺利，会返回退出状态0；否则返回非0
if [ $? -eq 0 ];then
    echo Successful
else
    echo Failure
fi

# 用ping命令编写脚本来查询一组IP地址，同时检查它们是否处于活动状态
for ip in 192.168.17.{1..255} ;
do
    (
        ping $ip -c 2 &> /dev/null;
        if [ $? -eq 0 ];then
            echo $ip is alive
        fi
    )&
done

# 等所有子进程结束才终止脚本
wait

# 使用fping查询网络上的主机状态
fping -a 192.168.17.1 192.168.17.255 -g

# 查询网络中的DNS数据
: '
cat ip.list
192.168.17.150
192.168.17.1
'
fping -a -d 2>/dev/null < ip.list