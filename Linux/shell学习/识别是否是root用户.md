```
#!/usr/bin/env bash

Green_background_prefix="\033[42;37m" && Font_color_suffix="\033[0m"

check_root(){
        [[ $EUID != 0 ]] && echo -e "${Error} 当前非ROOT账号(或没有ROOT权限)，无法继续操作，请更换ROOT账号或使用 ${Green_background_prefix}sudo su${Font_color_suffix} 命令获取临时ROOT权限（执行后可能会提示输入当前账号的密码）。" && exit 1
}
check_root
```

### echo


shell 脚本中 echo 显示内容带颜色显示，echo 显示带颜色，需要使用参数 -e 

例如：

``` shell
echo -e "\033[41;36m something here \033[0m" 
```

其中 41 的位置代表底色， 36 的位置是代表字的颜色 
>注： 
　　1、字背景颜色和文字颜色之间是英文的"" 
　　2、文字颜色后面有个m 
　　3、字符串前后可以没有空格，如果有的话，输出也是同样有空格 
