#/bin/bash -xv

# 查找网站中的无效链接
if [ $# -eq 2 ];then
    echo -e "$Usage $0 URL\n"
    exit -1;
fi

echo Broken linke;

mkdir /tmp/$$.lynx

cd /tmp/$$.lynx

# 在当前目录下生成数个文件，其中就有reject.dat文件，包含了网站中的所有链接
lynx -traversal $1 > /dev/null
count=0;
sort -u reject.dat > links.txt

while read link;
do
    output=`curl -I $link -s | grep "HTTP/.*OK";
    if [[ -z $output ]];then
        echo $link;
        let count++
    fi
done < links.txt

[ $count -eq 0 ] && echo No broken links found.