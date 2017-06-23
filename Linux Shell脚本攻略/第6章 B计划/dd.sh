#/bin/bash -xv

: '
dd语法:
dd if=SOURCE of=TARGET bs=BLOCK_SIZE count=COUNT
if代表输入文件或输入设备路径
of代表目录文件或目录设备路径
bs代表块大小
'
# 将一个分区复制到文件中
dd if=/dev/sda1 of=sda1_partition
# 使用备份恢复分区
dd if=sda1_partition of=/dev/sda1

# 永久性删除一个分区中所有的数据，可以用dd向该分区写入0值
dd if=/dev/zero of=/dev/sda1
# 在容量相同的硬盘间进行克隆
dd if=/dev/sda of=/dev/sdb

# 制作CD ROM的镜像(ISO文件)
dd if=/dev/cdrom of=cdrom.iso
