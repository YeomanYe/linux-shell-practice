#/bin/bash -xv


# rename命令使用Perl正则表达式修改文件名。
count=1;
for img in *.jpg *.png
do
    new=image-$count.${img##*.}
    # 移动图像数据到新文件中，不打印错误信息
    mv "$img" "$new" 2> /dev/null
    if [ $? -eq 0 ]; then
        echo "Reanming $img to $new "
        let count++
    fi
done

# 将*.JPG更名为*.jpg
rename *.JPG *.jpg
# 将文件名中的空格替换成字符"_"
find path -type f -exec rename 's/ /_/g' * {} \;
# 转换文件名大小写
rename 'y/A-Z/a-z/g' *
rename 'y/a-z/A-Z/g' *
