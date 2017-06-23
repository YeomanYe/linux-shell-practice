#/bin/bash -xv

# 统计行数
wc -l filename
# 使用stdin输入流
cat filename | wc -l
# 统计单词数
wc -w filename
# 统计字符数
wc -c filename

# 打印最长行的长度
wc filename -L
