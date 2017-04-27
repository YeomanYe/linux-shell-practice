#/bin/bash -xv


: '
创建特定大小的大文件最简单的方法就是利用dd命令。dd命令会克隆给定的输入内容，然后将一模一样的一份副本写入到输出。stdin、设备文件、普通文件等都可作为输入，stdout、设备文件、普通文件等也可作为输出。下面是使用dd命令的一个示例：
if 表示输入文件
of 表示输出文件
bs (block size) 表示块大小,单位:c(字节)，w(字)，b(块)
count 表示要被复制的块
/dev/zero是一个字符设备，它会不断返回0值字节(\0)
'
# 如果不指定输入默认是stdin，不指定输出默认是stdout
dd if=/dev/zero of=junk.data bs=1M count=1