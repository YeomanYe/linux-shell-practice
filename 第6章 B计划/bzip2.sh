#/bin/bash -xv

: '
创建
1级的压缩率最低，但是压缩速度最快；
9级的压缩率最高，但是压缩速度最慢
'
# 直接压缩后生成的文件的后缀带有.bz2
bzip2 filename
# -c用于将输出指定到stdout
cat file | bzip2 -c > file.tar.bz2
# 指定压缩率
bzip2 -9 test.img

: '
解压
'
# 删除输入文件
bunzip2 filename.bz2
# -k避免删除输入文件
bunzip2 test.bz2 -k
