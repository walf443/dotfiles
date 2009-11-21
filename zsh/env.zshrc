# vim:ft=zsh:

# common
export LANG="ja_JP.UTF-8"

if test -e /opt/local
then
    SYSTEM_PREFIX=/opt/local
else
    SYSTEM_PREFIX=/usr
fi

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

# zsh
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=1000000
export SAVEHIST=1000000

# prompt
export PROMPT="%n%# "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  export PROMPT="%{[37m%}%n@${HOST%%.*}%# "

export PYTHONSTARTUP=$HOME/.pythonrc.py


