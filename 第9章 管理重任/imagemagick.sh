#!/bin/bash -xv

# 将图像转换为另一种图像格式
convert INPUT_FILE OUTPUT_FILE
# 指定图像宽高
convert image.png -resize 1366x768 image.png
# 指定宽或高
convert image.png -resize x768 image.png
convert image.png -resize 1366x image.png
# 指定百分比缩放图像
convert image.png -resize "50%" image.png

# 图像管理脚本
if [ $# -ne 4 -a $# -ne 6 -a $# -ne 8 ];then
    echo Incorrect number of arguments
    exit 2
fi

while [ $# -ne 0 ];
do
    case $1 in
        -source) shift; source_dir=$1;shift;;
        -scale) shift;scale=$1;shift;;
        -percent) shift;percent=$1;shift;;
        -dest) shift;dest_dir=$1;shift;;
        -ext) shift;ext=$1;shift;;
        *) echo Wrong parameters;exit 2;;
    esac;
done

for img in `echo $source_dir/*`;
do
    source_file=$img
    if [[ -n $ext ]];then
        dest_file=${img%.*}.$ext
    else
        dest_file=$img
    fi

    if [[ -n $dest_dir ]];then
        dest_file=${dest_file##*/}
        dest_file="$dest_dir/$dest_file"
    fi

    if [[ -n $scale ]];then
        PARAM="-resize $scale"
    elif [[ -n $percent ]];then
        PARAM="-resize $percent%"
    fi

    echo Processing file : $source_file
    convert $source_file $PARAM $dest_file
done