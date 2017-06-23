#/bin/bash -xv

# lzma是一个相对较新的压缩工具，提供了gzip或zip2更好的压缩率
: '
创建
1级的压缩率最低，但是压缩速度最快；
9级的压缩率最高，但是压缩速度最慢
'
lzma filename
# -c用于将输出指定到stdout
cat file | lzma -c > file.lzma
# 9级压缩率
lzma -9 file.txt

: '
解压缩lzma文件
'
# 删除输入文件
unlzma filename.lzma
# -k保留输入文件
lzma test.bz2 -k