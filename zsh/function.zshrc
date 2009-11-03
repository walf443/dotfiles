
function memo() {
    screen vim $MYCHANGELOG_MEMO
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
