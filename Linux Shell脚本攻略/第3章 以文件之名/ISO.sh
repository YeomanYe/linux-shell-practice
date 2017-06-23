#/bin/bash -xv

# 从/dev/cdrom,创建一个ISO镜像
dd if=/dev/cdrom of=temp.iso
# 创建ISO文件，将hello目录中的内容写到 image.iso中 -V指定了ISO的卷标
mkisofs -V "Label" -o temp.iso hello
# 挂载光盘镜像
mkdir /mnt/iso
mount -o loop linux.iso /mnt/iso

: '
“混合ISO”的特殊ISO文件可以将可引导的ISO文件写入USB设备来引导操作系统
'
# 将ISO转换为混合ISO
isohybrid temp.iso
# 将ISO写入USB存储设备
dd if=temp.iso of=/dev/sdb1
# 或者
cat temp.iso > /dev/sdb1

# 刻录ISO,-speed 8指定速度为8x
cdrecord -v dev=/dev/cdrom temp.iso -speed 8
# 使用多区段方式刻录，这样就能一张关盘上分多次刻录数据。
cdrecord -v dev=/dev/cdrom temp.iso -multi

# CD ROM托盘控制
eject # 弹出驱动托盘
eject -t # 合上驱动托盘