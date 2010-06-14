# vim: ft=zsh:
alias spec='spec -c -Du -fs'

if where tscreen > /dev/null
then
    alias screen=tscreen
    alias s=tscreen
else
    alias s=screen
fi
