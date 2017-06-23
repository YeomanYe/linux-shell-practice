#/bin/bash -xv

# sed可以替换给定文本中的字符串
sed 's/pattern/replace_string/' filename
# 使用重定向保存替换后的结果
sed 's/pattern/replace_string/' filename > newfile
# 使用-i参数，将替换结果用于原文件
sed -i 's/pattern/replace_string' filename

# 替换所有匹配的内容
sed 's/pattern/replace_string/g' filename

# 从第N处开始替换
# 从第二处开始替换
echo this thisthisthis | sed 's/this/THIS/2g'

# 还可以使用的定界符
sed 's:text:replace:g'
sed 's|text|replace|g'

# 移除空白行
sed '/^$/d' filename

# 使用&标记已匹配的字符串
echo this is an example | sed 's/\w\+/[&]/g'

# 子串匹配\1
# 将digit 7替换为7
echo this is digit 7 in a number | sed 's/digit \([0-9]\)/\1/'
# 单词逆序输出
echo seven EIGHT | sed 's/\([a-z]\+\) \([A-Z]\+\)/\2 \1/'

# 使用双引号求值
text=hello
echo hello world | sed "s/$text/HELLO/"