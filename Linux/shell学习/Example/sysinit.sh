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
        echo "正在关闭 ufw 防火墙服务..."
        systemctl stop ufw
        echo "禁用 ufw 服务..."
        systemctl disable ufw
    elif [ "$release" = "centos" ];then
        echo "正在关闭 firewalld 防火墙服务..."
        systemctl stop firewalld
        echo "禁用 firewalld 服务..."
        systemctl disable firewalld
    fi
}

# 显示防火墙已开启的端口
list_firewall_port() {
    check_sys
    case "$release" in
    centos)
    firewall-cmd --state &> /dev/null
    [ $? -ne 0 ] && echo "防火墙未开启，正在开启..." && systemctl start firewalld &> /dev/null
    firewall-cmd --state &> /dev/null
    [ $? -ne 0 ] && echo "防火墙开启失败..." && exit 1
    echo "已开启的端口：`firewall-cmd --zone=public --list-ports`"
    ;;
    ubuntu)
    systemctl status ufw &> /dev/null
    [ $? -ne 0 ] && echo "防火墙未开启，正在开启..." && systemctl start ufw &> /dev/null
    systemctl status ufw &> /dev/null
    [ $? -ne 0 ] && echo "防火墙开启失败..." && exit 1
    port=`sudo ufw status | grep ALLOW | grep -v v6 | awk '{print $1}' | xargs`
    echo "已开启的端口：$port"
    ;;
    esac
}

# 新增防火墙开启端口
# add_firewall_port() {
# }

# 删除防火墙已开启的端口
# del_firewall_port() {
# }

# 检查网络连通状态
check_int(){
    # 检查 ping 是否安装
    hash ping &> /dev/null
    if [ $? -ne 0 ];then
        echo "当前主机未安装ping..."
        check_sys
        case "$release" in
          centos)
          echo "安装ping..."
          yum install -y ping &> /dev/null
          ;;
          *)
          echo "安装ping..."
          apt install -y ping &> /dev/null
          ;; 
        esac
    fi
    ping -c 1 www.baidu.com &> /dev/null
    [ $? -ne 0 ] && echo "网络没连通..." && exit 1
    echo "网络已经连通..."
}

# 获取主机公网IP
get_out_ip() {
    out_ip=`curl -s --connect-timeout 2 ip.sb`
    if [ $? -ne 0 ];then
        out_ip=`curl -s --connect-timeout 2 www.pubyun.com/dyndns/getip`
    fi
    if [ $? -ne 0 ];then
        out_ip=`curl -s --connect-timeout 3 curl members.3322.org/dyndns/getip`
    fi
    if [ $? -ne 0 ];then
        echo "请检查当前网络是否连接"
    fi
    echo "主机公网IP：$out_ip"
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
        yum -y update
    elif [ "$release" = "ubuntu" ];then
        cp /etc/apt/sources.list /etc/apt/sources.list.bak
        # sed 只能用单引号
        sed -i 's/archive\.ubuntu\.com/mirrors\.aliyun\.com/g' sources.list
        apt -y update
        apt -y upgrade
    fi
}


echo -e "系统初始化配置一键管理脚本
${Green_font_prefix}1.${Font_color_suffix}关闭 SELINUX
${Green_font_prefix}2.${Font_color_suffix}关闭并禁用防火墙
${Green_font_prefix}3.${Font_color_suffix}检查网络
${Green_font_prefix}4.${Font_color_suffix}更换国内阿里云软件源
${Green_font_prefix}5.${Font_color_suffix}获取当前主机公网IP
${Green_font_prefix}6.${Font_color_suffix}列出防火墙已开启的端口

" && echo

read -e -p "请输出[1-6]:" num
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
  5)
  get_out_ip
  ;;
  6)
  list_firewall_port
  ;;
  *)
  echo "请输入正确数字[1-6]"
  ;;
esac
