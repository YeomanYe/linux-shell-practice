#/bin/bash -xv


# 生成大小为100KB的测试文件
dd if=/dev/zero bs=100k count=1 of=data.file
# 指定分割大小，将文件分割成多个更小的文件
split -b 10k data.file
# -d 以数字为后缀，-a 指定长度为4，split_file 前缀
split -b 10k data.file -d -a 4 split_file
# 分割成多个文件，每个文件包含10行
split -l 10 data.file

: '
csplit 根据文件内容进行分割
cat server.log
SERVER-1
line1 ....
SERVER-2
line2 ...
SERVER-3
line3 ...
'
# /[REGEX]/匹配文本样式，
# {*}表示根据匹配重复进行分割
# -s 进入静默模式
# -n 指定分割后的文件名后缀的数字个数
# -f 指定分割后的文件名前缀
# -b 指定后缀的格式
csplit server.log /SERVER/ -n 2 -s {*} -f server -b "%02d.log" ; rm server00.log
