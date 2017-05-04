#/bin/bash -xv

# 跟踪网页更新
if [ $# -eq 2 ];then
    echo -e "$Usage $0 URL\n"
    exit -l;
fi

first_time=0
# 非首次运行

if [ ! -e "last.html" ];then
    first_time=1
    # 首次运行
fi

curl --silent $1 -o recent.html

if [ $first_time -ne 1 ];then
    changes=$(diff -u last.html recent.html)
    if [ -n "$changes" ];then
        echo -e "Changes:\n"
        echo "$changes"
    else
        echo -e "\nWebsite has no change"
    fi
else
    echo "[First run] Archiving.."
fi

cp recent.html last.html