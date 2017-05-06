#/bin/bash -xv

# 将源目录复制到目的端
# -a表示要进行归档
# -v表示打印细节信息或进度
# -z表示在网络传输时使用数据压缩
rsync -avz source_path destination_path
: '
路径格式可以是/home/slynux/data
也可以是slynux@192.168.0.6:/home/backups/data
'
# 将远程主机上的数据恢复到本地主机上
rsync -av username@host:PATH destination

# 归档时排除部分文件
rsync -avz /home/code/some_code /mnt/disk/backup/code --excludes "*.txt"
# 从一个列表中排除--exclude-from

# 在更新rsync备份时，删除不存在的文件
rsync -avz source_path destination_path --delete

# 定时调度
crontab -e
# 在其中添加这么一行，表示10小时执行一次
0 */10 * * * rsync -avz /home/code user@IP_ADDRESS:/home/backups
