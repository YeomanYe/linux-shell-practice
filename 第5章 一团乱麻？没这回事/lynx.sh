#/bin/bash -xv

: '
使用lynx将网页以ASCII字符的形式下载到文本文件中，这个命令将所有的超链接作为文本输出到页脚列在References标题下
'
# -dump选项将网页以ASCII字符的形式下载到文本文件中
lynx -dump URL > web.txt