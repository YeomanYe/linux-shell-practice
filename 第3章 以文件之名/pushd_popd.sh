#/bin/bash -xv

# 使用pushd将路径入栈并切换到对应的路径下
pushd /var
pushd /usr
pushd /root

# 查看栈中的内容
dirs

# 切换到对应的路径，下标从0开始
pushd +3

# 出栈不切换目录
popd
# 指定删除哪个位置的元素
popd +3