# vim:ft=zsh:
bindkey -e
setopt extended_history
setopt share_history
setopt mark_dirs
setopt auto_pushd
setopt list_packed
setopt prompt_subst
autoload -U colors
colors

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
autoload -U compinit ; compinit
compinit
