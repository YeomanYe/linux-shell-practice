#/bin/bash -xv


: '
xargs命令应该紧跟在管道操作符之后。它以标准输入作为主要的源数据流，并使用stdin并通过提供命令行参数来执行其他命令。
'

: '
cat example.txt
1 2 3 4 5 6
7 8 9 10
11 12
'
# 多行变单行
cat example.txt | xargs
# 单行变多行xargs默认定界符" "
cat example.txt | xargs -n 3

# 使用自己的定界符分隔参数
echo "splitXsplitXsplitXsplitXsplitXsplit" | xargs -d X -n 2

: '
准备args.txt文件和cecho.sh文件
cat args.txt
arg1
arg2
arg3

cecho.sh
echo $*"#"
'
# 一次提供两个参数
cat args.txt | xargs -n 2 ./cecho.sh
# 提供形如 ./cecho.sh -p arg1 -l 这样的参数
cat args.txt | xargs -I {} ./cecho.sh -p {} -l

# 为了防止文件中的空格造成文件的误删，因此要将定界符改为'\0';-0将'\0'作为输入定界符
find . -type -f -name "*.tmp" -print0 | xargs -0 rm -f 

# 统计目录中所有C程序文件的行数
find source_code_dir_path -type f -name "*.c" -print0 | xargs -0 wc -l

# 使用子shell和whle执行多条语句
cat files.txt | ( while read arg; do cat $arg; done )