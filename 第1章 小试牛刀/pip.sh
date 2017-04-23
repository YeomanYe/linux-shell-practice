#/bin/bash -xv


# 输出文件列表并添加行号
ls | cat -n > out.txt

# 使用子shell读取命令列输出
cmd_output=$(ls | cat -n)
echo $cmd_output
cmd_output=`ls | cat -n`
echo $cmd_output

# 子shell
: '
子shell是一个独立的进程，当命令在子shell中执行时，不会对当前的shell有任何影响
'
pwd ;
(cd /bin ; ls);
pwd ;
