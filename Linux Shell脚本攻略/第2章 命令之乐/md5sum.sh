#/bin/bash -xv


# 生成文件的校验和并定向到file_sum.md5中
md5sum temp.sh > file_sum.md5

# 用生成的文件核实数据完整性:
md5sum -c file_sum.md5
# 使用所有.md5信息检查所有的文件
md5sum -c *.md5

: '
sha1sum与md5sum的用法相同，但是应该将文件后缀改为.sha1
'

# 校验目录 md5deep（需要先安装） 或 find递归校验
# -r 使用递归方式 -l 使用相对路径
md5deep -r /WEB-INF > dir.md5
find /WEB-INF -type f -print0 | xargs -0 md5sum >> directory.md5

md5sum -c *.md5