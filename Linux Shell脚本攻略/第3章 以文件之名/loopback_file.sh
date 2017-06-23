#/bin/bash -xv


: '
环回文件系统存在于文件之中。我们通过将环回文件连接到一个设备文件来进行挂载（mount）。（即存在于文件中的文件系统需要挂载后才能够读取文件中的内容，这样的文件一般为外部存储设备硬盘、u盘、cdrom等设备文件）
'
# 创建个1G的文件
dd if=/dev/zero of=loopbackfile.img bs=1G count=1
# 使用mkfs命令格式化文件为ext4文件系统
mkfs.ext4 loopbackfile.img
# 检查该文件系统
file loopbackfile.img

# 挂载环回文件
mkdir /mnt/loopback
# -o loop用来挂载环回文件系统
# 在内部，这个环回文件连接到了一个名为/dev/loop1或loop2的设备上。
mount -o loop loopbackfile.img /mnt/loopback

# 等价于
: '
losetup /dev/loop1 loopback.img
mount /dev/loop1 /mnt/loopback
'


: '
创建某个硬盘文件，然后对它分区并挂载其中某个分区
losetup /dev/loop1 loopback.img
fdisk /dev/loop1
'

# 创建并挂载第一个分区
# /dev/loop2 表示第一个分区，第一个分区自硬盘第32256字节之后开始。前32256用于作为主引导记录
losetup  -o 32256 /dev/loop2 loopback.img

# 卸载分区，也可以使用设备文件的路径
umount /mnt/loopback

# 挂载光盘镜像
mkdir /mnt/iso
mount -o loop linux.iso /mnt/iso

#　通过sync立即应用更改
# 只有当缓冲区被写满之后才会进行设备回写
sync