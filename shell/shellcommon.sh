# ===========================================
# 优先级
# LC_ALL > LC_* > LANG
LANG="en_US.UTF-8"
# 比较和习惯
LC_COLLATE="zh_CN.UTF-8"
# 语言符号及分类
LC_CTYPE="zh_CN.UTF-8"
# 提示信息
LC_MESSAGES="zh_CN.UTF-8"
# 货币单位
LC_MONETARY="zh_CN.UTF-8"
# 数字
LC_NUMERIC="zh_CN.UTF-8"
# 时间显示格式
LC_TIME="zh_CN.UTF-8"
# 姓名书写方式
LC_NAME="zh_CN.UTF-8"
LC_ALL=


# ===========================================
# gcc 查找头文件顺序
# 首先 -I 然后找gcc的环境变量
# 然后找gcc的环境变量C_INCLUDE_PATH,CPLUS_INCLUDE_PATH,OBJC_INCLUDE_PATH
# 再找内定目录
# /usr/include  
# /usr/local/include
# … … 
# 日常程序自己编译的放在$HOME/usr/include/下
# 库文件
# 首先 -L
# 然后找gcc环境变量LIBRARY_PATH
# 再找内定目录
# /lib
# /usr/lib
# /usr/local/lib
# … … 

# 开始设置几个关键的环境变量
# C_INCLUDE_PATH & CPLUS_INCLUDE_PATH
# LIBRARY_PATH & LD_LIBRARY_PATH
# PATH
# PKG_CONFIG_PATH
# 
# ------ 首先,肯定是我自己编译安装的目录 ------
PATH="$HOME/usr/bin"
C_INCLUDE_PATH="$HOME/usr/include"
LIBRARY_PATH="$HOME/usr/lib"
PKG_CONFIG_PATH="$HOME/usr/lib/pkgconfig:$HOME/usr/local/lib/pkgconfig"

# ------ 特殊其它目录 ------
if [ -d $HOME/.jumbo/ ];then
    # 百度的开发机,添加jumbo目录
    JUMBO_ROOT="$HOME/.jumbo"
    export JUMBO_ROOT

    PATH="$PATH:$JUMBO_ROOT/bin"
    C_INCLUDE_PATH="$C_INCLUDE_PATH:$JUMBO_ROOT/include"
    LIBRARY_PATH="$LIBRARY_PATH:$JUMBO_ROOT/lib"

    PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$JUMBO_ROOT/lib/pkgconfig"
fi

if [ -d /home/tools/tools/scmtools/usr/bin ];then
    # 百度的开发机提供的工具
    PATH="$PATH:/home/tools/tools/scmtools/usr/bin"
fi

# ------ 系统目录 ------
C_INCLUDE_PATH="$C_INCLUDE_PATH:/usr/local/include"
C_INCLUDE_PATH="$C_INCLUDE_PATH:/usr/include"

LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
LIBRARY_PATH="$LIBRARY_PATH:/usr/lib"

PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/pkgconfig"
PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"

PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/bin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:/sbin"

# 导出
export PATH
export LIBRARY_PATH
export C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH="$C_INCLUDE_PATH"
export LD_LIBRARY_PATH="$LIBRARY_PATH"

# ===========================================
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ===========================================
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ===========================================
export SVN_EDITOR=vi
ulimit -c 1000

# ===========================================
# go lang env
OS=$(uname)
if [ "$OS"x = "Darwin"x ]; then
    if [ -d /usr/local/Cellar/go ];then
        GOROOT=$(brew info go|grep -e '^/usr/local/Cellar/go'|tail -n 1|awk '{print $1}')
        GOROOT=$GOROOT/libexec
        export GOROOT
        export PATH=$PATH:$GOROOT/bin
    fi
fi

if [ -d $HOME/opt/go ];then
    GOROOT=$HOME/opt/go
    export GOROOT
    export PATH=$PATH:$GOROOT/bin
fi

# new dev
GO_WORKSPACE=$HOME/src/goworkspace
if [ -d $GO_WORKSPACE ];then
    export GOPATH=$GO_WORKSPACE
    export PATH=$PATH:$GOPATH/bin
fi
unset GO_WORKSPACE

