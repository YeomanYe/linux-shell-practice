#/bin/bash -xv


# 读取n个字符存放入变量
read -n 2 var
echo $var

# 不回显的方式读取
read -s var
echo $var

# 显示提示信息
read -p "Enter input:" var
echo $var

# 特定时限(秒)内读取输入
read -t 2 var
echo $var

# 已指定字符结束
read -d ":" var
echo $var