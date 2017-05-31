# vim: ft=zsh:
alias spec='spec -c -Du -fs'
alias be='bundle exec'

alias ag="ag --pager 'less -R' "

function git-select-hash() {
 git log --oneline --branches | peco | awk '{print $1}'
}

function git-select-branch() {
    git branch --sort=-authordate | peco | sed -e "s/^\*[ ]*//g"
}

alias -g H='$(git-select-hash)'

alias -g B='$(git-select-branch)'

if test ! -z "$TMUX"
then
    function s() {
        tmux new-window "$*"
    };
    alias screen=s
else
    if where tscreen > /dev/null
    then
        alias screen=tscreen
        alias s=tscreen
    else
        alias s=screen
    fi
fi

