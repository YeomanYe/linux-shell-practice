#/bin/bash -xv


: '
权限类型
文件:r(读)、w(写)、x(执行)、S(setuid允许用户以其拥有者的权限来执行可执行文件,出现在用户组的执行权限位置)
目录:
r 允许读取目录中的文件和子目录列表
w 允许在目录中创建或删除文件或目录
x 指明是否可以访问目录中的文件和子目录
t(T同时设置了x) 当一个目录设置了粘滞位，只有创建该目录的用户才能删除目录中的文件，粘滞位出现在其他用户权限中的设置权限(x)位置
'
# u:user g:group o:other
# 设置权限
chmod u=rwx g=rw o=r filename
# 增加权限
chmod o+x filename
# 删除权限
chmod a-x filename

# 使用二进制设置权限
# 设置权限: rwx rw- r--
chmod 764 filename

# 设置粘滞位
chmod a+t directory_name

# 以递归方式设置权限
chmod 777 . -R
chmod 777 "$(pwd)" -R

# 设置setuid,只能用在Linux ELF格式的二进制文件，不能用于脚本文件
chmod +s executable_file

: '
更改所有者
'
chown user.group filename
# 以递归方式设置权限
chown user.group . -R
