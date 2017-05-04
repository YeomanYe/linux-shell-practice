#/bin/bash -xv

# 根据URL下载,-o指定日志 -O指定输出文件名
wget www.baidu.com -O baidu.html -o html.log
# -t指定重试次数
wget -t 5 www.baidu.com
# 限速下载
wget --limit-rate 20k URL
# -Q限定下载配额，配额一旦用尽下载随之停止
wget -Q 100m URL1 URL2
# -c断点续传
wget -c URL
# 镜像整个网站
wget --mirror URL
#-l指定页面层级DEPTH，这意味着wget只会向下遍历指定的页面级数。这个选项要与-r（recursive，递归选项）一同使用。另外，-N允许对文件使用时间戳，URL表示下载的网站起始地址。
wget -r -N -l DEPTH URL
# 访问需要认证的HTTP或FTP页面
wget --user username --password pass URL
# 使用POST方式发送数据
wget URL -post-data "name=value" -O output.html