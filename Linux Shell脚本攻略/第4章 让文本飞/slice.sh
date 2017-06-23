#/bin/bash -xv

# 使用变量实现切片操作
var="This is a line of text"
# 替换
echo ${var/line/REPLACED}
# 子串
echo ${var:5}
echo ${var:5:2}
# 反向索引要在括号内
echo ${var:(-1)}
echo ${var:(-4):2}