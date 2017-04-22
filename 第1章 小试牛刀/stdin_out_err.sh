#/bin/bash

# 覆盖输出
echo "This is sample text 1 >" > temp.txt
# 追加输出
echo "This is sample text 2 >>" >> temp.txt
# >等同于1>;>>等同于1>>

# 错误输出到out.txt
ls + 2> out.txt 1> out.txt

: '等价于:
ls + 2>&1 out.txt
ls + &> out.txt
' 
# 丢弃错误信息
ls + 2> /dev/null

# 既能重定向到文件又能打印到终端
cat test.sh | tee out.txt | cat -n
# 追加到out.txt文件中
cat test.sh | tee -a out.txt | cat -n

# 输出为stdout
echo who is this | tee -
# 等价于
echo who is thie | tee /dev/stdout
# 输入/dev/stdin,输出/dev/stdout,错误/dev/stderr

# 重定向内部脚本块
cat <<EOF>log.txt
LOG FILE HEADER
This is a test log file
Function: System statistics
EOF

cat log.txt

: '
自定义文本描述符exec
文本描述符使用>,>>,<以及3以后的数字来自定义
'
echo this is a test line > input.txt
exec 3<input.txt
cat <&3
# 如果在次读取就不能继续使用文本描述符3，而是要再次分配