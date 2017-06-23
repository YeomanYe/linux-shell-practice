#/bin/bash -xv

: '
创建
'
# 用tar对文件进行归档，
# -c代表创建文件，
# -f代表指定文件名(-f应该是最后一个参数)
# -v或-vv代表输出详细信息
# --totals完成归档后打印总字节数
tar -cvf output.tar file1 file2 --totals

: '
添加
'
# -r向已存在的归档文件添加一个文件
tar -rvf original.tar new_file
# 拼接两个归档文件
tar -Af file1.tar file2.tar

: '
修改
'
# 列出归档中的文件内容
tar -tvf archive.tar
# 根据文件内容修改时间更新归档文件
tar -uvf archive.tar filea

: '
提取
'
# -x从归档文件中提取文件或文件夹，-C指定需要将文件提取到哪个目录
tar -xf archive.tar -C /root/test
# 提取特定文件
tar -xvf file.tar file1 file4
# -c输出到stdout，-x从stdin提取内容
tar -cf - file1 file2 file3 | tar -xvf - -C ~/destination

: '
查看
'
# 比较归档文件中的文件是否与文件系统中的文件有差别
tar -df archive.tar filename1 filename2

: '
删除
'
# 从归档文件中删除文件
tar -f archive.tar --delete file1 file2

: '
压缩
-j bunzip2格式，扩展名bz2
-z gzip格式，扩展名gz
--lzma lzma格式，扩展名lzma
-a或--auto-compress 根据扩展名自行选择压缩格式
'

: '
排除
'
# 排除匹配样式的文件
tar -cf arch.tar * --exclude "*.txt"
# 根据文件列表排除文件
tar -cf arch.tar * -X list
