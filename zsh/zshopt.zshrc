# vim:ft=zsh:
bindkey -e
bindkey ";5C" forward-word # C- →で単語分進む
bindkey ";5D" backward-word # C - ← で単語分戻る
bindkey "\C-j" forward-word
bindkey "\C-g" backward-word

setopt extended_history
setopt extended_glob
setopt share_history
setopt mark_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt list_packed
setopt prompt_subst
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_nodups
setopt magic_equal_subst
autoload -U colors
colors

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' use-cache true
autoload -U compinit ; compinit
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
compinit
compdef _screen tscreen
