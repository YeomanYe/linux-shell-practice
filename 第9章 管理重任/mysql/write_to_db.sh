#!/bin/bash -xv


# set -x
# 将数据插入数据表
USER="root"
PASS="1316"

if [ $# -ne 1 ];then
    echo $0 DATAFILE
    echo 
    exit 2
fi
data=$1

oldIFS=$IFS
IFS=,
while read line;
do
    set -x
    values=($line)
    values[1]="\"`echo ${values[1]} | tr ' ' '#' `\""
    values[3]="\"`echo ${values[3]}`\""

    query=`echo ${values[@]}  | tr ' #' ', '`
    
mysql -u $USER -p$PASS students <<EOF
INSERT INTO students VALUES($query);
EOF
done<  $data
IFS=$oldIFS
echo wrote data into DB