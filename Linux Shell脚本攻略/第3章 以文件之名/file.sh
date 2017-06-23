#/bin/bash -xv

# 打印文件类型
file filename
# 只打印文件类型-b
file -b filename


: '
生成文件统计信息的脚本
'
if [ $# -ne 1 ]; then
    echo $0 bashpath;
    echo
fi
path=$1

declare -A statarray;

while read line;
do
    ftype=`file -b "$line"`
    let statarray["$ftype"]++;
done< <(find $path -type f -print)

echo ============= File types and counts =================
for ftype in "${!statarray[@]}"
do
    echo $ftype : ${statarray["$ftype"]}
done

: '
done＜＜(find path -type f -print);
是一段很重要的代码。它的执行逻辑如下： 
while read line; 
do something 
done＜ filename
＜(find path -type f -print)等同于文件名。只不过它用子进程输出来代替文件名。注意这里还有另外一个 ＜。

${!statarray[@]}用于返回一个数组素引列表。
'