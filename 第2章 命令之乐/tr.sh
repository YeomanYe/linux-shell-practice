#/bin/bash -xv


: '
tr可以对来自标准输入的字符进行替换、删除以及压缩。
'

# 将输入字符由大写转换成小写
echo "HELLO WHO IS THIES" | tr 'A-Z' 'a-z'

# 使用tr进行加密
echo 12345 | tr '0-9' '987643210'
# ROT13加密和解密使用同一个序列
echo "tr came, tr saw, tr conquered." | tr 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' 'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm'

# -d删除字符
echo "Hello 123 world 456" | tr -d '0-9'

# -c定义补集
echo hello 1 char 2 next 4 | tr -d -c '0-9 \n'
# 1 2 4

# -s压缩输入中重复的字符
echo "GNU is    not     UNIX. Recursive right ?" | tr -s ' '

# 将输入序列相加
: '
cat sum.txt
1
2
3
4
5
'
cat sum.txt | echo $[ $(tr '\n' '+' ) 0 ]

# 字符类
: '
alnum: 字母和数字
alpha: 字母
digit: 数字
lower: 小写字母
upper: 大写字母
print: 可打印字符
punct: 标点符号
space: 空白字符
xdigit: 十六进制字符
...
'
echo abc | tr '[:lower:]' '[:upper:]'