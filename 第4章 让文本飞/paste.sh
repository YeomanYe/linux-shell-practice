#/bin/bash -xv

: '
按列拼接文件
cat file1.txt
1
2
3
cat file2.txt
linux
unix
windows
mac
cat file3.txt
user1
user2
'
paste file1.txt file2.txt file3.txt
# -d指定定界符
paste file1.txt file2.txt file3.txt -d ","