#/bin/bash -xv

: '
压缩
'
# 对归档文件采用zip格式进行压缩
zip archive.zip filename
# 对目录和文件进行递归操作
zip -r archive.zip folder1 file2

: '
解压
'
# 解压缩后不会删除归档文件
unzip file.zip

: '
更新
'
# 重新归档文件中的内容
zip file.zip -u newfile

: '
查看
'
# 列出归档文件中的内容
unzip  -l archive.zip

: '
删除
'
# -d从归档文件中删除内容
zip -d arc.zip file.txt