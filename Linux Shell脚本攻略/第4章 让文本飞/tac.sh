#/bin/bash -xv

# 以逆序形式打印行
seq 5 | tac
# 逆序打印文件，设置行分隔符为空格；默认行分隔符为\n
tac file1 file2 -s " "

# 使用awk实现
seq 6 | \
awk '{ lifo[NR]=$0; lno=NR } END{ for(;lno>=1;lno--){print lifo[lno]; }}'