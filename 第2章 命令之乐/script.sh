#/bin/bash -xv


: '
两个配置文件被当做script命令的参数。其中一个文件（timing.log）用于存储时序信息，描述每一个命令在何时运行；另一个文件（output.session）用于存储命令输出。-t选项用于将时序数据导入stderr。2＞则用于将stderr重定向到timing.log。
'

# 只能在命令行中使用

: '
# 开始记录命令
script -t 2> timing.log -a output.session
ls
# 结束记录
exit
# 命令回放
scriptreplay timing.log output.session
'