# vim:ft=zsh:

# common
LANG="ja_JP.UTF-8"
SYSTEM_PREFIX=/opt/local/
EDITOR=$SYSTEM_PREFIX/bin/vim
PAGER="/$SYSTEM_PREFIX/bin/lv -c"
CLICOLOR=\1
PATH=~/bin:/opt/local/bin:$PATH
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
MANPATH=$MANPATH:/$SYSTEM_PREFIX/man

if [ `uname` = 'Darwin' ]
then
    PATH=$PATH:/Applications/Adobe\ Flex\ Builder\ 3/sdks/3.2.0/bin/
fi

# zsh
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

# ruby
RUBYOPT="rubygems -Ku"
GEM_PATH=/Library/Ruby/Gems/
GEM_HOME=/Library/Ruby/Gems/
RUBYLIB=$SYSTEM_PREFIX/lib/ruby/1.8/:$RUBYLIB

# perl
PERL5LIB="$HOME/site_perl/:$PERL5LIB"

# prompt
PROMPT="%n%# "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{[37m%}%n@${HOST%%.*}%# "

