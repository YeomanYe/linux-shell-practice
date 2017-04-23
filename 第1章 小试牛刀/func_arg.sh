#/bin/bash -xv


# 定义函数
function fname(){
    echo $1, $2 ;
    echo "$@" ;
    echo "$*" ;
    return 0 ;
}

: '
$1是第一个参数。
$n是第n个参数。 
"$@" 被扩展成 "$1" "$2" "$3"等。
"$*" 被扩展成 " $1c$2c$3"，其中c是IFS的第一个字符。 
"$@" 用得最多。由于 "$*"将所有的参数当做单个字符串，因此它很少被使用。
'

# 执行函数
fname $1 $2;

: '
Fork炸弹
:(){ :|:& };:
可以不断生成新进程，最终造成拒绝服务攻击
可以通过修改配置文件/etc/security/limits.conf来限制可生成的最大进程数。 
'

# 导出函数，作用域可以扩展到子进程中
export -f fname

# 获取命令或函数返回值
echo $?

# 检测某条命令是否成功结束：
CMD="cat log.txt"
$CMD
if [ $? -eq 0 ];
    then
    echo "$CMD executed successfully"
else
    echo "$CMD terminated unsuccessfully"
fi
