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

function sshs() {
    local host=$1

    local host_without_user="$( echo "$host" | sed -r -e 's/^(.+)@(.+)$/\2/' )"
    if test "$host_without_user" = ""
    then
        host_without_user="$host"
    fi

    local screen_title="$( get_ipv4_tail $host_without_user )"
    if test "$screen_title" = ""
    then
        screen_title=$( echo $host_without_user | sed -r -e 's/(.+)\.(local|intra)$/\1/')
    fi

    if test "$screen_title" = ""
    then
        screen ssh $host
    else
        screen -t "[$screen_title]" ssh $host
    fi
}

function get_ipv4_tail () {
    local ip=$1
    local tail=$( echo $ip | grep 192.168 | sed  -r -e 's/192\.168\.([0-9]+)\.([0-9]+)/\2/' )
    echo $tail
}

function peco-find-file() {
    if git rev-parse 2> /dev/null; then
        source_files=$(git ls-files)
    else
        source_files=$(find . -type f)
    fi
    selected_files=$(echo $source_files | peco --prompt "[find file]")

    result=''
    for file in $selected_files; do
        result="${result}$(echo $file | tr '\n' ' ')"
    done

    BUFFER="${BUFFER}${result}"
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-find-file
tty -s && stty start undef # C-q
bindkey '^q' peco-find-file

