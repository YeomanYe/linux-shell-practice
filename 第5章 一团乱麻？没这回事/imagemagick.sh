#/bin/bash -xv

# 用当前目录下的图片创建相册
echo "Creating album.."
mkdir -p thumbs
cat <<EOF > index.html
<html>
<head>
<style>
body{
    width:470px;
    margin:auto;
    border:1px sashed grey;
    padding:10px;
}
img{
    margin:5px;
    border:1px solid black;
}
</style>
</head>
<body>
<center><h1> #Album title </h1></center>
<p>
EOF

for img in *.png;
do
    # 获得图片为宽度100px的缩略图
    convert "$img" -resize "100x" "thumbs/$img"
    echo "<a href=\"$img\" ><img src=\"thumbs/$imgs\" title=\"$img\" /></a>" >> index.html
done

cat <<EOF >> index.html
</p>
</body>
</html>
EOF

echo Album generated to index.html