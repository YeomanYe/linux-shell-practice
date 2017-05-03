#/bin/bash -xv

# 用途：从网页上抓取并下载图片
if [ $# -ne 3 ];then
    echo "Usage: $0 URL -d DIRECTORY"
    exit -1
fi

for i in {1..4}
do
    case $1 in
        -d) shift; directory=$1; shift;;
         *) url=${url:-$1}; shift;;
    esac
done

mkdir -p $directory
set -x
baseurl=$(echo $url | egrep -o "https?://[a-z.]+")

curl -s $url | egrep -o "<img src=[^>]*>" | sed 's/<img src=\"\([^"]*\).*/\1/g' > /tmp/$$.list
# 将相对路径转换为绝对路径
sed -i "s|^/|$baseurl/|" /tmp/$$.list
cd $directory;
while read filename;
do
    curl -s -O "$filename" --silent
done < /tmp/$$.list