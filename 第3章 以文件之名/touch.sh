#/bin/bash -xv

: '
touch 会将所有时间戳改为当前时间
如果只想更改某些时间戳
touch -a 更改访问时间
touch -m 更改内容修改时间
touch -d 指定时间戳
'
# 批量生成名字不同的空白文件:
for name in {1..5}.txt
do
    touch $name
done

touch -d "Fri Jun 52 20:50:14 IST 1999" filename