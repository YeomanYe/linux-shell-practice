#/bin/bash -xv

# 找出给定文件中指定长度的回文字符
if [ $# -ne 2 ]; then
    echo "Usage: $0 filename string_length"
    exit -1
fi

filename=$1 ;

basepattern='/^\(.\)'

count=$(( $2 / 2 ))

for ((i=1;i<$count;i++))
do
    basepattern=$basepattern'\(.\)';
done

if [ $(( $2 % 2 )) -ne 0 ];then
    basepattern=$basepattern'.';
fi

for ((count;count>0;count--))
do
    basepattern=$basepattern'\'"$count";
done

basepattern=$basepattern'$/p'
sed -n "$basepattern" $filename

: '
/p 表示打印
-n 表示不打印不匹配的内容
使用:
bash test.sh /usr/share/dict/words 4
'

# 使用goto和标签实现
word="malayalam"
echo $word | sed ':loop ; s/^\(.\)\(.*\)\1/\2/; t loop; /^.\?$/{ s/.*/PALLNDROME/ ; q; }; s/.*/NOT PALLNDROME/ '

# 使用rev命令
# rev逆序打印出每一行的内容
string="malayalam"
if [[ "$string" == "$( echo $string | rev )" ]];then
    echo "Palindrome"
else
    echo "Not Palindrome"
fi