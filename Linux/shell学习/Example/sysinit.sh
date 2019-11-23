#!/bin/bash
# xiechengqi

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"

[ `whoami` != 'root' ] && echo '请以root权限执行次脚本!' && exit 1

# 检查Linux系统
check_sys(){
         if [[ -f /etc/redhat-release ]]; then
                release='centos'
         elif cat /etc/issue | grep -q -E -i 'debian'; then
                release='debian'
         elif cat /etc/issue | grep -q -E -i 'ubuntu'; then
                release='ubuntu'
         elif cat /etc/issue | grep -q -E -i 'centos|red hat|redhat'; then
                release='centos'
         elif cat /proc/version | grep -q -E -i 'debian'; then
                release='debian'
         elif cat /proc/version | grep -q -E -i 'centos|red hat|redhat'; then
                release='centos'
         elif cat /proc/version | grep -q -E -i 'ubuntu'; then
                release='ubuntu'
         fi
         echo $release
}

# 关闭SELINUX
dis_selinux(){
    [ -f /etc/selinux/config ] 
    [ $? -eq 0 ] && cp /etc/selinux/config /etc/selinux/config.back && sed -i 's/SELINUX=enforcing/\SELINUX=disabled/' /etc/selinux/config && setenforce 0
}

# 关闭并禁止 firewall
dis_firewall(){
    if [ "$release" = "ubuntu" ];then
        echo "关闭 ufw 防火墙服务..."
        systemctl stop ufw
        echo "禁用 ufw 服务..."
        systemctl disable ufw
    elif [ "$release" = "centos" ];then
        echo "关闭 firewalld 防火墙服务..."
        systemctl stop firewalld
        echo "禁用 firewalld 服务..."
        systemctl disable firewalld
    fi
}

# 检查网络
check_int(){
    ping -c 1 www.baidu.com &> /dev/null
    [ $? -ne 0 ] && echo "没有网络..." && exit 1
    echo "网络正常..."
}


# 替换 aliyun 软件源
change_software_sources(){
	echo "更换 aliyun 软件源"
    # 双引号才能解析特殊字符$ ，单引号就是原样输出
    if [ "$release" = "centos" ];then
        echo "备份 /etc/yum.repos.d/CentOS-Base.repo 为 /etc/yum.repos.d/CentOS-Base.bak"
        cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum/repos.d/CentOS-Base.bak
        wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
        sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
        yum clean all
        yum makecache
    elif [ "$release" = "ubuntu" ];then
        cp /etc/apt/sources.list /etc/apt/sources.list.bak
        # sed 只能用单引号
        sed -i 's/archive\.ubuntu\.com/mirrors\.aliyun\.com/g' sources.list
        apt update
        apt upgrade -y
    fi
}


echo -e "系统初始化配置一键管理脚本
${Green_font_prefix}1.${Font_color_suffix}关闭 SELINUX
${Green_font_prefix}2.${Font_color_suffix}关闭并禁用防火墙
${Green_font_prefix}3.${Font_color_suffix}检查网络
${Green_font_prefix}4.${Font_color_suffix}更换国内阿里云软件源" && echo

read -e -p "请输出[1-4]:" num
case "$num" in
  1)
  dis_selinux
  ;;
  2)
  check_sys
  dis_firewall
  ;;
  3)
  check_int
  ;;
  4)
  check_sys
  change_software_sources
  ;;
  *)
  echo "请输入正确数字[1-4]"
  ;;
esac
