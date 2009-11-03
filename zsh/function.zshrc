
function memo() {
    screen $EDITOR $MYCHANGELOG_MEMO
}

function zconf() {
    screen $EDITOR $MYZSHRC
}

function vconf() {
    screen $EDITOR ~/.vimrc
}

function gitnew() {
    branch=$1
    shift # dummy
    opt=$*
    if test ! $branch
    then
        branch=origin/master
    elif test "$branch" = "-p"
    then
        opt=$branch
        branch=origin/master
    else
        # full option.
    fi
    git whatchanged $branch@{1}..$branch --reverse --stat $opt
}
