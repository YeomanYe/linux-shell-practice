#/bin/bash -xv


: '
连接以太网
'
IFACE=eth0
IP_ADDR=192.168.17.150
SUBNET_MASK=255.255.255.0
GW=192.168.17.1
HW_ADDR='00:1c:bf:87:25:d2'

if [ $UID -ne 0 ];then
    echo "Run as root"
    exit 1
fi

# 进行新的配置前关闭接口
/sbin/ifconfig $IFACE down
if [[ -n $NW_ADDR ]];then
    /sbin/ifconfig hw ether $HW_ADDR
    echo $poofed MAC ADDRESS to $HW_ADDR
fi

/sbin/ifconfig $IFACE $IP_ADDR netmask $SUBNET_MASK

route add default gw $GW $IFACE
echo Successfully configured $IFACE

