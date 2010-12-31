# vim:ft=zsh:

# common
export LANG="en_US.UTF-8"

if test -e /opt/local
then
    SYSTEM_PREFIX=/opt/local
else
    SYSTEM_PREFIX=/usr
fi

# export MYSQL_PS1='[34m[\d][00m > '

export EDITOR=$SYSTEM_PREFIX/bin/vim
export PAGER="$SYSTEM_PREFIX/bin/lv -c"
export EMAIL=walf443@gmail.com
export MYCHANGELOG_MEMO=$HOME/ChangeLog

export CLICOLOR=\1

OPT_PATH=$HOME/bin:/opt/local/bin:/usr/local/bin
PATH=${PATH/$OPT_PATH/}
export PATH=$OPT_PATH:$PATH
if [ `uname` = 'Darwin' ]
then
    FLEX_SDK_PATH=/Applications/Adobe\ Flex\ Builder\ 3/sdks/3.2.0/bin/
    PATH=${PATH/$FLEX_SDK_PATH/}
    export PATH=$PATH:$FLEX_SDK_PATH

    export IPHONE_PLATFORM=iPhoneOS
    export IPHONE_VERSION=3.1.2
    export IPHONE_SDK=/Developer/Platforms/${IPHONE_PLATFORM}.platform/Developer/SDKs/${IPHONE_PLATFORM}${IPHONE_VERSION}.sdk/System/Library/Frameworks/
fi

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export MANPATH=$MANPATH:$SYSTEM_PREFIX/man
# 1セクションが3とかより優先されるとウザいのです
export MANSECT=3:2:1:1p:3p:8:2:4:5:6:7:9:0p:tcl:n:l:p:o

# zsh
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=1000000
export SAVEHIST=1000000

# prompt
export PROMPT="%n%# "
if [ -n "${REMOTEHOST}${SSH_CONNECTION}" ]
then
    if [ "${HOST%%.*}" = "$ENV{USER}" ]
    then
        export PROMPT="%{[37m%}%n@${HOST%%.*}%# "
    fi
fi

export PYTHONSTARTUP=$HOME/.pythonrc.py

tty -s && stty stop undef
