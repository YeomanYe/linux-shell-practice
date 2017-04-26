#/bin/bash -xv


: '
-print 打印匹配文件的文件名（路径），使用'\n'当作分隔符
-print0 使用'\0'作为分隔符
'
# 打印文件和目录的列表
find . -print


# 指定文件名,-iname忽略大小写
find /root -name "*.txt" -print
# 匹配多个条件
find . \( -name "*.txt" -o -name "*.sh" \) -print

# 将文件路径作为一个整体进行匹配
find /home/users -path "*list*" -print
# 使用正则表达式匹配路径,-iregex忽略正则表达式大小写
find . -regex ".*\(\.py\|\.sh\)$"

# 否定参数,匹配不以txt结尾的文件
find . ! -name "*.txt" -print

# 设置搜索深度
: '
设置只在当前目录下搜索 -maxdepth 1
从子目录开始搜索 -mindepth 2
-maxdepth 与 -mindepth 两个参数应该放在前头，泳衣提高效率
'
find . -maxdepth 1 -type f -print

# 根据文件类型搜索
: '
文件类型 类型参数
普通文件 f
符号链接 l
目录 d
...
'
find . -type f -print

# 根据文件时间进行搜索
: '
单位是天
访问时间(-atime)
修改时间(-mtime): 文件内容最后一次被修改的时间
变化时间(-ctime): 文件元数据最后一次改变的时间
-表示小于 +表示大于 

单位是分钟
-amin、-mmin、cmin

-newer 指定一个用于比较时间戳的参考文件
'
# 访问时间小于7天的参考文件
find . -type f -atime -7 -print
# 比file.txt修改时间更长的文件
find . -type f -newer file.txt -print

# 根据文件大小搜索
: '
b 块(512字节)
c 字节
w 字
k 
M 
G
'
find . -type f -size +2k

# 删除匹配的文件
find . -type f -name "temp.txt" -delete

# 基于文件权限和所有权的匹配
# 获取没有设置好执行权限的php文件
find . -type f -name "*.php" ! -perm 644 -print
# 打印出用户slynux拥有的所有文件
find . -type f -user slynux -print

# 结合find执行命令或动作,{}匹配任何一个文件名，如果想适配多个命令用脚本文件代替
# 更改所有者为slynux
find . -type f -user root -exec chown slynux {} \;
# 将所有C文件整合到all_c_files.txt中
find . -type f -name "*.c" -exec cat {} \;>all_c_files.txt
# 将十天前的文件复制到OLD目录中
find . -type f -mtime +10 -name "*.txt" -exec cp {} OLD \;

# 跳过特定的目录
find deve1/source_path \( -name ".git" -prune \) -o \( -type f -print \)