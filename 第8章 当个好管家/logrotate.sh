#!/bin/bash -xv


: '
logrotate配置文件中的内容
[root@localhost ~]# cat /etc/logrotate.d/yum
/var/log/yum.log {
    #如果日志文件丢失，则忽略，然后返回
    missingok
    #仅当原日志非空才对其进行轮替
    notifempty
    #限制实施轮替日志文件的大小，1M表示1MB
    size 30k
        #允许用gzip对较旧的日志进行压缩
        compress
    #指定进行轮替的时间间隔,weekly,yealy,daiily
    yearly
        #指定保留的归档数量
        rotate 5
    #指定所要创建的归档文件的模式、用户以及用户组
    create 0600 root root
}
'
