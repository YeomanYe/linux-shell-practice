#/bin/bash -xv

# 设置文件的不可修改
chattr +i filename
rm filename
chattr -i filename