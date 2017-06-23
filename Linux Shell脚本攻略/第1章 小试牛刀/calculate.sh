#/bin/bash

: '
整数计算
'

num1=4;
num2=5;

# 使用let
let result=num1+num2;
let num1++;
let num2--;
let num1+=6;
let num2-=6;

echo $num1 , $num2

# 使用[]
result=$[ num1 + num2 ]
result=$[ $num1 + 5 ]

# 使用(())
result=$(( num1 + 50 ))

# 使用expr
result=`expr 3 + 4`
result=$(expr $num1 + 5 )

echo $result

: '
浮点数运算
'

no=54
result=`echo "$no * 1.5 " | bc`
echo $result

# 设置小数个数
result=`echo "scale=2;3/8" | bc`
echo $result

: ' 
进制转换
'

no=100
echo "obase=2;$no" | bc

no=1100100
echo "obase=10;ibase=2;$no" | bc
