#!/bin/bash -xv


# 批量解压缩
ls *.tar.gz > ls.$$
ls *.tgz > ls.$$
for i in $(cat ls.$$)
do
    tar -zxvf $i & > /dev/null
done
rm -rf ls.$$