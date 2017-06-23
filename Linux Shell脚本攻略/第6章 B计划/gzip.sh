#/bin/bash -xv

: '
创建
1级的压缩率最低，但是压缩速度最快；
9级的压缩率最高，但是压缩速度最慢
'
# 压缩后的文件名默认带有.gz后缀
gzip filename
# -c用来将输出指定到stdout
cat file | gzip -c > file.gz
# 指定压缩级别--fast或--best
gzip --fast filename
# 指定9级压缩率
gzip -9 test.img

: '
解压
'
# 解压缩gzip文件
gunzip filename.gz

: '
查看
'
# 列出压缩文件的属性
gzip -l test.txt.gz
# 直接打印文本的内容
zcat test.gz

# 因为tar只能接收有限个参数，如果文件列表中有大量的文件需要归档压缩可以使用追加文件的形式
FILE_LIST="file1 file2 file3 file4 file5"
for fi in $FILE_LIST;
do
    tar -rvf archive.tar $f
done
gzip archive.tar
