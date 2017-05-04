#/bin/bash -xv

: '
cURL通常将下载文件输出到stdout，将进度信息输出到stderr，要想避免显示进度信息，使用--silent
'
# -O将下载数据写入文件而非标准输出(URL必须是指向远程文件的),--sileent选项使得curl不显示进度信息
curl www.baidu.com --silent -O
# -o用来将下载的数据写入指定名称的文件中，--progress指定显示进度条
curl www.baidu.com --progress -o index.html

# 断点续传
# 以指定偏移量进行断点续传，偏移量以字节为单位
curl URL/file -C offset
# 让CURL自己进行推测断点续传的位置
curl -C -URL

# 设置参照页，即设置请求头中的Referer字段
curl --referer http://google.com http://www.163.com

#　指定cookie
curl URL --cookie "user=root;pass=guess"
# 将cookie另存为一个文件,使用--cookie-jar选项
curl URL --cookie-jar cookie_file

# 设置头部信息
curl -H "Host: www.baidu.com" -H "Accept-language: en" URL

# 限定带宽
curl URL --limit-rate 20k

# 指定最大下载量,超出最大下载量返回非0的退出码
curl URL --max-filesize bytes

# -u完成HTTP或FTP认证
curl -u user:pass URL
# 不写密码会有密码提示
curl -u user URL

# -I或-head只打印头部信息
curl -I http://www.baidu.com

# 发送POST请求
curl URL -d "postvar=data&postvar2=data2"
