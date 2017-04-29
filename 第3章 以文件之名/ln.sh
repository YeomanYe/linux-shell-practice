#/bin/bash -xv

# 创建符号链接，符号链接标志l，-s软链接，-h硬链接
ln -s /var/www/ ~/test/web

# 查看软链接名称
ls -l | grep "^l" | awk '{ print $9} '
# 使用find打印符号链接
find . -type l -print

# 使用readlink打印符号链接指向的目标
readlink mail