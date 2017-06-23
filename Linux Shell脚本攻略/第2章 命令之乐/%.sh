#/bin/bash -xv


# 提取文件名
file_jpg="sample.jpg"
name=${file_jpg%.*}
echo File name is: $name
# 提取扩展名
extension=${file_jpg#*.}
echo Extensions is: $extension

: '
 {VAR%.*} 的含义是： 从 VARIABLE中删除位于%右侧的通配符（在前例中是.*）所匹配的字符串。通配符从右向左进行匹配。
 
 %属于非贪婪（non-greedy）操作。它从右到左找出匹配通配符的最短结果。还有另一个操作符%%，这个操作符与%相似，但行为模式却是贪婪的（greedy)，这意味着它会匹配符合条件的最长的字符串。

#、##与%、%%匹配方向相反
'

VAR=hack.fun.book.txt
echo ${VAR%.*}
echo ${VAR%%.*}
echo ${VAR#*.}
echo ${VAR##*.}
# ##比#更适合用于提取扩展名,%比%%更适合用于提取文件名