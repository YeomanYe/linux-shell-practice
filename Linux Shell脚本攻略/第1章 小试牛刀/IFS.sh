#/bin/bash -xv


data="name,sex,rollno,location"
oldIFS=$IFS
IFS=,
for item in $data ;
do
    echo Item: $item
done
IFS=$oldIFS

: '
读取用户及其对应的shell
'
# line="root:x:0:0:root:/root:/bin/bash"
oldIFS=$IFS;
IFS=$'\n'
lines=$(cat /etc/passwd)
count=0
for line in $lines
do
    # echo $line
    IFS=":"
    for item in $line;
do
    [ $count -eq 0 ] && user=$item;
    [ $count -eq 6 ] && shell=$item;
    let count++
done;
count=0
echo $user \'s shell is $shell;
IFS=$'\n'
done
IFS=$oldIFS