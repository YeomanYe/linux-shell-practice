#!bin/bash -xv

clear
if [[ $# -eq 0 ]];then
    reset_terminal=$(tput sgr0)
    # Check OS Type
    os=$(uname -o)
    echo -e '\E[32m' "Check OS Type:" $reset_terminal $os
    # Check OS Release Version and Name
    version=$(cat /etc/issue | grep -e "release")
    echo -e '\E[32m' "Check OS Release Version and Name:" $reset_terminal $version
    # Check Architecture
    architecture=$(uname -m)
    echo -e '\E[32m' "Check Architecture:" $reset_terminal $architecture
    # Check Kernel Release
    kernelrelease=$(uname -r)
    echo -e '\E[32m' "Check Kernel Release:" $reset_terminal $kernelrelease
    # Check hostname $HOSTNAME
    echo -e '\E[32m' "Check hostname:" $reset_terminal $HOSTNAME
    # Check Internal IP
    internalip=$(hostname -I)
    echo -e '\E[32m' "Check Internal IP:" $reset_terminal $internalip
    # Check External IP
    externalip=$(curl -s http://ipecho.net/plain)
    echo -e '\E[32m' "Check External IP:" $reset_terminal $externalip
    # Check DNS
    nameservers=$(cat /etc/resolv.conf | grep -E "\<nameserver[ ]+" | awk '{print $NF}')
    echo -e '\E[32m' "Check DNS:" $reset_terminal $nameservers
    # Check if connected to Internet or not
    ping -c 2 imoo.com &> /dev/null && echo "Internal:Connected" || echo "Internet:Disconnected"
    # Check Logged In Users
    who> /tmp/who
    echo -e '\E[32m' "Logged In Users" $reset_terminal && cat /tmp/who 
    rm -f /tmp/who
#######################################
    echo -e '\E[35m' "****************System Run Info**********************" 
    system_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
    echo -e '\E[32m'"Operating System Memuserages :" $reset_terminal $system_mem_usages
    app_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}' /proc/meminfo)
    echo -e '\E[32m'"Operating System App Memuserages :" $reset_terminal $app_mem_usages
    loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')

    echo -e '\E[32m'"Operating System Load Averages :" $reset_terminal $loadaverage

    diskaveage=$(df -hP | grep -vE 'Filesystem|tmpfs|文件系统' | awk '{print $1 " " $5}')
    echo -e '\E[32m'"Operating System Disk Averages :" $reset_terminal $diskaveage
fi