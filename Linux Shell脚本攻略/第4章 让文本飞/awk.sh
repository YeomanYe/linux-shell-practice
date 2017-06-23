#/bin/bash -xv


# awk脚本的基本结构
# awk ' BEGIN { print "start" } pattern { commands } END{ print "end" } file
: '
awk命令的工作方式如下所示。 
(1) 执行BEGIN { commands } 语句块中的语句。 
(2) 从文件或stdin中读取一行，然后执行pattern { commands }。重复这个过程，直到文件全部被读取完毕。 
(3) 当读至输入流（input stream）末尾时，执行END { commands } 语句块。

最重要的部分就是pattern语句块中的通用命令。这个语句块同样是可选的。如果不提供该语句块，则默认执行{ print }，即打印每一个读取到的行。awk对于读取的每一行，都会执行这个语句块。
每读取一行时，它就会检查该行和提供的样式是否匹配。样式本身可以是正则表达式、条件以及行匹配范围等。如果当前行匹配该样式，则执行{ }中的语句。 

样式是可选的。如果没有提供样式，那么它就会默认所有的行都是匹配的，并执行{ }中的语句
'
echo -e "line1\nline2" | awk 'BEGIN{ print "Start" } { print } END { print "END" }' 
# 以逗号,分隔，以空格作为定界符
echo | awk '{ var1="v1"; var2="v2"; var3="v3"; print var1,var2,var3;}' # v1 v2 v3
# 使用""拼接字符
echo | awk '{ var1="v1"; var2="v2"; var3="v3"; print var1"-"var2"-"var3 ;}' # v1-v2-v3

# 特殊变量
: '
以下是可以用于awk的一些特殊变量。 
NR：表示记录数量（number of records），在执行过程中对应于当前行号。 
NF：表示字段数量（number of fields），在执行过程中对应于当前行的字段数。 
0：这个变量包含执行过程中当前行的文本内容。 
1：这个变量包含第一个字段的文本内容。 
2：这个变量包含第二个字段的文本内容。

'
echo -e "line1 f2 f3\nline2 f4 f5\nline3 f6 f7" | \
awk '{ print "Line no:"NR",No of fields:"NF, "$0="$0, "$1="$1, "$2="$2 }'
# 打印每一行的第一和第三个字段:
awk '{ print $1,$3 }' a.txt
# 统计文件中的行数
awk 'END{ print NR }' a.txt
# 统计示例
seq 5 | awk 'BEGIN{ sum=0; print "Summation:" } {print $1"+"; sum+=$1 } END { print "=="; print sum }'

# 将外部变量值传递给awk
VAR=1000
echo | awk -v VARIABLE=$VAR '{ print VARIABLE }'
# 或者
echo | awk '{ print VARIABLE }' VARIABLE=$VAR
# 读取来自文件的输入
echo | awk '{ print VARIABLE }' VARIABLE=$VAR filename

# 使用var读取行
seq 5 | awk 'BEGIN { getline; print "Read ahead first line", $0 } { print $0 }'

# 模式匹配
awk 'NR<5' # 行号小于5的行
awk 'NR==1,NR==4' # 行号在1-5之间的行
awk '/linux/' # 包含样式linux的行,可以使用正则表达式
awk '!/linux/' # 不含linux的行

# 设置定界符
awk -F: '{ print $NF }' /etc/passwd
# OFS输出字段的定界符
awk 'BEGIN { FS=":"; OFS="ABC" } { print $NF }' /etc/passwd

# 读取命令输出作为awk输入
echo | awk '{ "grep root /etc/passwd" | getline cmdout ; print cmdout }'

: '
awk中使用循环，格式如下:
for(i=0;i<10;i++){ print $i; }
for(i in array){ print array[i]; }
常用的字符控制函数
length(string)
index(string,search_string)
split(string,array,delimiter)
substr(string,start-position,end-position)
sub(regex,replacement_str,string)：替换字符串
gsub(regex,replacement_str,string) 替换所有内容
match(regex,string) 匹配到返回非0;match有两个相关的特殊变量，RSTART（匹配内容的起始位置）、RLENGTH（匹配到的长度）
'

# 打印4到6行
seq 100 | awk 'NR==4,NR==6'

# 打印处于两个样式之间的文本
: '
cat section.txt
line with pattern1
line with pattern2
line with pattern3
line end with pattern4
line with pattern5
'
awk '/pa.*3/,/end/' section.txt