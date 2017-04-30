#/bin/bash -xv

# 打印树形目录
tree /tmp
# -I重点标记符合某种样式之外的某种样式 "*.jpg"匹配的样式
tree /tmp -I "*.jpg"
# 只打印符合的某种样式
tree /tmp -P "*.jpg"
# 同时打印出文件和目录的大小
tree -h
# 生成HTML形式的输出目录,http://localhost应该替换为适合存放输出文件的URL。
tree /tmp -H http://localhost -o out.html
# 只查看到第2级目录
tree . -L 2