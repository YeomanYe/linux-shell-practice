#/bin/bash -xv

: '
crypt加解密需要一个口令
'
# 口令PASSPHRASE
# 加密
crypt PASSPHRASE < input_file > output_file
# -d解密
# 解密
crypt PASSPHRASE -d < encrypted_file > output_file

: '
gpg
'
# 加密
gpg -c filename
# 解密
gpg filename.gpg

: '
Base64
'
# 编码
base64 filename > outputfile
cat file | base64 > outputfile
# 解码
base64 -d file > outputfile

: '
md5sum与sha1sum是单向加密无法推出原始数据
'
md5sum file
sha1sum file

: '
shadow密码通常都是salted密码。所谓SALT就是额外的一个字符串，用来起一个混淆的作用，使加密更加不易被破解。salt由一些随机位组成，被用作密钥生成函数的输入之一，以生成密码的salted散列值。
openssl 是一个用于加密的工具箱
'
# passwd表示使用的加密命令
# -1表示使用md5风格的加密
# -salt表示用于混淆加密字符串
# PASSWORD表示密码
openssl passwd -1 -salt SALT_STRING PASSWORD