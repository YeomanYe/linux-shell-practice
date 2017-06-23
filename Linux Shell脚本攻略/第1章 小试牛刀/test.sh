#/bin/bash -xv


: '
算术比较: 
-gt大于 -lt小于 -ge大于或等于 -le小于或等于 -eq等于 -ne不等于
[ $var -eq 0 ]
'

: '
逻辑操作:
[ $var1 -ne 0 -a $var2 -gt 2 ]
[ $var -eq 0 ] or [ $var -eq 0 ]
[[ -z $str1 ]] || [[ -n $str2 ]]
'

: '
文件系统:
[ -f $var ] 给定的变量包含正常的路径或文件名，则返回真。
[ -x $var ] 可执行返回真
[ -d $var ] 为目录返回真
[ -e $var ] 存在返回真
[ -w $var ] 文件可写返回真
[ -r $var ] 文件可写读回真
[ -L $var ] 文件为符号链接返回真
'

: '
字符串比较:
[[ $str1 = $str2 ]] 或者 [[ $str1 == $str2]]
[[ $str1 != $str2 ]]
[[ -z $str ]] 空字符串返回真
[[ -n $str ]] 非空字符串返回真
'
str1="Not empty"
str2=""
if [[ -n $str1 ]] && [[ -z $str2 ]]; then
    echo str1 is non-empty and str2 is empty string.
fi

# 使用test命令
var=0
if test $var -eq 0; then echo "True"
fi
