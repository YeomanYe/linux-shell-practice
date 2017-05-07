#!/bin/bash -xv

# 根据设置修改下面的参数
IFACE=wlan0
IP_ADDR=192.168.17.150
SUBNET_MASK=255.255.255.0
GW=192.168.17.1
# 物理地址欺骗
HW_ADDR='00:1c:bf:87:25:d2'

ESSID="homenet"
WEP_KEY=123456789
FREQ=2.462G

KEY_PART=""
if [[ -n $WEP_KEY ]];then
    KEY_PART="key $WEP_KEY"
fi

# 进行配置之前关闭接口
/sbin/ifconfig $IFACE down
if [ $UID -ne 0 ];then
    echo "Run as root"
    exit 1;
fi
if [[ -n $HW_ADDR ]];then
    /sbin/ifconfig $IFACE hw ether $HW_ADDR
    echo Spoofed MAC ADDRESS to $HW_ADDR
fi

/sbin/iwconfig $IFACE essid $ESSID $KEY_PART freq $FREQ
/sbin/ifconfig $IFACE $IP_ADDR netmask $SUBNET_MASK
route add default gw $GW $IFACE
echo Successfully configured $IFACE