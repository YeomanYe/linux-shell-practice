#/bin/bash -xv


# 对一组文件进行排序
sort file1.txt file2.txt > sorted1.txt
sort file1.txt file2.txt -o sorted2.txt

# 找出已排序文件中不重复的行:
cat sorted1.txt | uniq > uniq_lines.txt

# 按数字进行排序
sort -n file1.txt
# 按逆序进行排序
sort -r file1.txt
# 按月份进行排序
sort -M file1.txt

# 测试文件
sort -C file1.txt;
if [ $? -eq 0 ]; then
    echo Sorted;
else
    echo Unsorted;
fi

# 合并文件但不进行排序
sort -m file1.txt file2.txt

: '
依据键或列进行排序
cat data.txt
1 mac 2000
2 winxp 4000
3 bsd 1000
'
# 第一列、按照数字、逆序排列
sort -nrk 1 data.txt
# 用字符的起止位置作为键的书写格式。
sort -nk 2,3 data.txt

# 忽略文本中像空格一样的字符，并以字典序进行输出
sort -bd data.txt

# 输出唯一的行
sort -u sorted.txt

: '
不输出重复的行
cat sorted.txt
bash
foss
hack
hack
'
# 只显示唯一的行
uniq sorted.txt
# 找出文件中重复的行
uniq -d sorted.txt
# 统计重复次数
uniq -c sorted.txt
# -s 指定可以跳过前N个字符 -w 指定用于比较的最大字符数 -u 不输出重复内容
uniq -s 1 -w 1 -u sorted.txt
# -z 修改定界符为\0
uniq -z sorted.txt | xargs -0 -I {} echo {}

: '
输入: ahebhaaa
输出: 4a1b1e2h
'
INPUT="ahebhaaa"
OUTPUT=` echo $INPUT | sed 's/[^.]/&\n/g' | sed '/^&/d' | sort | uniq -c | tr -d ' \n'`
echo $OUTPUT
# sed 's/[^.]/&\n/g'在每一个字符后添加一个换行符
# sed '/^&/d'用于删除最后的空行
# tr -d '\n'删除换行符