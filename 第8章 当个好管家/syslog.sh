#!/bin/bash -xv


: '
比较重要的日志文件
/var/log/boot.log 系统启动信息
/var/log/httpd Appache Web服务器日志
/var/log/message 发布内核启动信息
/var/log/auth.log 用户认证日志
/var/log/dmesg 系统启动信息
/var/log/mail.log 邮件服务器日志
/var/log/Xorg.0.1.log X服务器日志
'
# 向/var/log/message中记录日志信息
logger LOG_MESSAGE
# -t加上特定标记，默认是用户名
logger -t TAG This is a message
# 将一个日志文件的最后一行记录到系统日志中
logger -f /var/log/source.log
