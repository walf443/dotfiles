# vim:ft=zsh:

# common
LANG="ja_JP.UTF-8"
SYSTEM_PREFIX=/opt/local/
EDITOR=$SYSTEM_PREFIX/bin/vim
PAGER="/$SYSTEM_PREFIX/bin/lv -c"
CLICOLOR=\1
PATH=~/bin:/Library/Ruby/Gems/bin:$PATH
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
MANPATH=$MANPATH:/$SYSTEM_PREFIX/man

# zsh
HISTFILE=$HOME/.zsh-history
HISTSIZE=1000000
SAVEHIST=1000000

# ruby
RUBYOPT="rubygems -Ku"
RUBYLIB=$SYSTEM_PREFIX/lib/ruby/1.8/:$RUBYLIB
GEM_PATH=/Library/Ruby/Gems/
GEM_HOME=/Library/Ruby/Gems/
SPEC_OPTS='-Du -c -fs'

# perl
PERL5LIB="$HOME/site_perl/:$PERL5LIB"

# prompt
PROMPT="%n%# "
RPROMPT=$(print "%{[34m%}[ %(5~,%-2~/.../%2~,%~) ]%{[m%}")
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{[37m%}%n@${HOST%%.*}%# "

