#/bin/bash -xv

: '
使用git+crontab进行定期差异备份
脚本路径/home/data/backup.sh
'
# 需要备份的路径
cd /home/data/source
git add .
git commit -am "Commit - @ $(data)"
git push

# 在shell界面输入
# 定时调度命令
crontab -e
# 设置为5小时执行一次脚本
0 */5 * * * /home/data/backup.sh