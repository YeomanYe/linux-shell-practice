#/bin/bash -xv

: '
cpio类似于tar，能保留归档文件的所有属性，如权限、文件所有权等
'
# 通过stdin获取输入文件名，并将归档文件写入stdout
# -o指定了输出，-v用来打印归档文件列表
echo file1 file2 file3 | cpio -ov > archive.cpio
# 列出归档文件的内容
# -i用于指定输入，-t表示列出归档文件中的内容
cpio -it < archive.cpio
# 提取文件
# -d表示提取内容；文件会输出到输入时相同的绝对路径上
cpio -id < archive.cpio