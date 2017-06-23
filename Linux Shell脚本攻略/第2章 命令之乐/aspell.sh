#/bin/bash -xv


# 检查给定的单词是否是词典中的单词
word=$1
# ^单词的开始,$单词的结束,-q禁止产生任何输出
grep "^$1$" /usr/share/dict/words -q
if [ $? -eq 0 ]; then
    echo $word is a dictionary word;
else
    echo $word is not a dictionary word;
fi

# 使用aspeell判断是否在词典中
output=`echo \"$word\" | aspell list`
# -z判断output是否为空
if [ -z $output ]; then
    echo $word is a dictionary word;
else
    echo $word is not a dictionary word;
fi

# 列出文件中以特定单词起头的所有单词
look word test.txt
grep "^word" test.txt

# 查找默认词典中的单词
look word