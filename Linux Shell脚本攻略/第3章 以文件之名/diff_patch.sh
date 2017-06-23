#/bin/bash -xv

: '
cat version1.txt
line2
line3
line4
happy hacking!
cat version2.txt
this is the original text
line2
line4
happy hacking!
GNU is not UNIX
'
# 非一体化形式的diff输出
diff version1.txt version2.txt
# 一体化(unified)形式的diff输出
diff -u version1.txt version2.txt
# 生成一个修补文件
diff -u version1.txt version2.txt > version.patch
# 修补
patch -p1 version1.txt < version.patch

# 生成目录差异信息
diff -Naur directory1 directory2
: '
-N: 将所有缺失的文件视为空文件
-a: 将所有文件视为文本文件。
-u: 生成一体化输出。
-r: 遍历目录下的所有文件
'