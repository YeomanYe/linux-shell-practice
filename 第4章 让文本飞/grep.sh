#/bin/bash -xv

# 返回匹配的行,可以对多个文件搜索
grep "word" filename1 filename2
echo -e "this is a word\nnext line" | grep word
# --color重点标记出匹配单词
echo -e "this is a word\nnext line" | grep word --color=auto

# 使用正则表达式，使用-E或egrep
grep -E "[a-z]+"
egrep "[a-z]+"

# -o只输出匹配到的文本部分
echo this is a line. | grep -o -E "[a-z]+\."
# -v打印除包含匹配之外的所有行
grep -v "word" filename
# -c统计文件或文本中包含匹配字符串的行数
grep -c "word" filename

# 统计匹配行数量
echo -e "1 2 3 4\nhello\n5 6" | egrep -c "[0-9]"
# 统计匹配项数量
echo -e "1 2 3 4\nhello\n5 6" | egrep -o "[0-9]" | wc -l
# -n打印行并显示函数
echo -e "1 2 3 4\nhello\n5 6" | egrep -o "[0-9]" -n

# 递归搜索
grep "word" . -R
# 忽略样式中大小写
echo hello world | grep -i "HELLO"
# 匹配多个样式
echo this is a line of text | grep -e "line" -e "text" -o

: '
使用样式文件进行多样式匹配
cat pat_file
hello
cool
'
grep -f pat_file filename

# 在grep中搜索包括或排除文件
# 搜索所有c,cpp为后缀的文件,-r递归搜索
grep "main()" . -r --include "*.{c,cpp}"
# 排除README文件
grep "main()" . -r --exclude "README"
# 排除目录
grep "main()" . -r --exclude-dir "directory"
# 从文件中读取所需排除的文件列表
grep "main()" . -r --exclude-from filename

# 使用0值字节后缀
grep "test" file* -lZ | xargs -0 rm

# -q静默模式，不打印匹配。只返回数字判断是否匹配成功，0匹配成功
grep -q match_text filename
echo $?

# 打印匹配的周围几行
# 匹配后3行
seq 10 | grep 5 -A 3
# 匹配前3行
seq 10 | grep 5 -B 3
# 匹配前后3行
seq 10 | grep 5 -C 3