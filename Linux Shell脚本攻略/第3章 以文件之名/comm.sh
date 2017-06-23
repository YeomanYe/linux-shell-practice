#/bin/bash -xv


: '
comm必须使用排过序的文件作为输入
cat A.txt
apple
orange
gold
silver
steel
iron

cat B.txt
orange
gold
cookies
carrot

-1 从输出中删除第一列
-2 -3
'
sort A.txt -o A.txt ; sort B.txt -o B.txt
comm A.txt B.txt

# 求AB中互不相同的行，并合并为1列
comm A.txt B.txt -3 | sed 's/^\t//'
# A.txt的差集
comm A.txt B.txt -2 -3
# B.txt的差集
comm A.txt B.txt -1 -3