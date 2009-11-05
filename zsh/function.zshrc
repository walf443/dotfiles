
function memo() {
    screen $EDITOR $MYCHANGELOG_MEMO
}

function zconf() {
    screen $EDITOR $MYZSHRC
}

function vconf() {
    screen $EDITOR ~/.vimrc
}

function conf_commit {
    pwd=`pwd`
    cd $HOME/project/dotfiles/
    git commit -v -a
    if test !$?
    then
        git push
    fi
    cd $pwd
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

