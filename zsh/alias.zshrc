# vim: ft=zsh:
alias spec='spec -c -Du -fs'

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
