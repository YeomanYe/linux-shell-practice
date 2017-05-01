#/bin/bash -xv

: '
迭代行、单词、字符
'
# 迭代行
while read line;
do
    echo $line
    # 迭代一行中的每个单词
    for word in $line;
    do
        echo $word;
        # 迭代一个单词中的每个字符
        for ((i=0;i<${#word};i++))
        do
            echo ${word:i:1};
        done
    done
done < a.txt
# 使用子shell的方式
cat a.txt | (while read line; do echo $line; done)

: '
${#word}返回变量长度
${word:start_position:no_of_characters}返回变量word所包含的字符串中的一个子串
'