#/bin/bash

# 普通数组声明
array_var=( 1 2 3 4 5 6 )
array_var[0]="text1"

# 引用
index=0
echo 'array_var[$index]'
echo ${array_var[$index]}

# 以清单形式打印出数组中的所有值
echo '$array_var[*]'
echo ${array_var[*]}
# 等价于
echo 'array_var[@]'
echo ${array_var[@]}

# 数组长度
echo '${#array_var[*]}'
echo ${#array_var[*]}

# 关联数组
echo 关联数组
# 声明
declare -A ass_array
ass_array=([index1]=val1 [index2]=val2)
ass_array[index3]=val3
# 列出数组索引
echo ${!ass_array[*]}
echo ${!ass_array[@]}
