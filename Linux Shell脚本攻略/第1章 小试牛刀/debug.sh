#/bin/bash -xv

for i in {1..6}
do
    set -x
    echo $i
    set +x
done
echo "Script executed"


: '
自定义调试信息
'
function DEBUG()
{
    # 需要设置一个环境变量export _DEBUG=on才能使用
    [ "$_DEBUG" == "on" ] && $@ || :
}

for i in {1..10}
do
    DEBUG echo $i
done