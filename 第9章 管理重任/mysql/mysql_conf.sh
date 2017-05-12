#!/bin/bash -xv


# 安装配置mysql
# 这个命令就会查看该操作系统上是否已经安装了mysql数据库
rpm -qa | grep mysql　
# 强力删除模式，如果使用上面命令删除时，提示有依赖的其它文件，则用该命令可以对其进行强力删除　
rpm -e --nodeps mysql　
# 通过yum进行安装
yum install -y mysql-server mysql mysql-deve
# mysql启动
service mysqld start
# 将musql配置为开机启动
chkconfig mysqld on
# 给root账号设置密码
mysqladmin -u root password 'root'　

# mysql主要配置文件
cat /etc/my.cnf
# 数据库文件存放位置
ll /var/lib/mysql/
# 日志文件
cat /var/log/mysqld.log