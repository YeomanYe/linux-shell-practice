#/bin/bash -xv

: '
cat data.txt
No Name Mark Percent
1 Tom 45 90
2 John 51 80
3 Tony 60 99
'
# 提取2,4列,-d 用于定设置定界符
cut -f 2,4 -d " " data.txt
# 提取除第2列外的所有列
cut -f 2 -d " " --complement data.txt

: '
cat range.txt
abcdefghijklmn
abcdefghijklmn
abcdefghijklmn
abcdefghijklmn
'
# 打印前两个字符
cut -c2 range.txt
# 打印1-5,7-8字符，并指定输出定界符为,
cut -c1-5,7-8 range.txt --output-delimiter ","
: '
-b 表示字节
-c 表示字符
-f 表示定义字段
'