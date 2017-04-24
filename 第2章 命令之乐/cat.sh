#/bin/bash -xv


echo "This is a line inside file1.txt" > file1.txt
echo "This is a line inside file2.txt" > file2.txt

# 拼接多个文件文本
cat file1.txt file2.txt

# 拼接输入流与文本, -指代标准输入流
echo 'Text through stdin' | cat - file1.txt

# 压缩空白行
cat temp.sh | tr -s '\n'
cat temp.sh -s
   
# 将制表符显示为^I
cat -T temp.sh

# 显示行号
cat -n temp.sh