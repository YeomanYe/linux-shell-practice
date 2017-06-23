#/bin/bash -xv


: '
读取交互式输入的脚本,interactive.sh
read -p "Enter number:" no;
read -p "Enter name:" name;
echo You have entered $no, $name;
'
echo -e "1\nhello\n" | bash ./interactive.sh
# 使用输入文件的方式
echo -e "1\nhello\n" > input.data
bash ./interactive.sh < input.data

# 使用expect实现交互式输入自动化
#!/usr/bin/expect
spawn bash ./interactive.sh
expect "Enter number:"
send "1\n"
expect "Enter name:"
send "hello\n"
expect eof
: '
spawn参数指定需要自动化哪一个命令；
expect参数提供需要等待的消息；
send是要发送的消息；
expect eof指明命令交互结束。
'