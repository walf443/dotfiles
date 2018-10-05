# vim:ft=zsh:

if [ `uname` = 'Darwin' ]
then
    USE_VCS_INFO=1
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' formats '%s[%b]'
    zstyle ':vcs_info:*' actionformats '%s[%b|%a]'
fi

_set_env_vcs_stat() {
    VCS_STAT=()
    LANG=ja_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && VCS_STAT="$vcs_info_msg_0_"
}

_set_env_git_current_branch() {
      GIT_CURRENT_BRANCH=$( git branch 2> /dev/null | grep '^\*' | cut -b 3- )
      VCS_STAT=$GIT_CURRENT_BRANCH
}

_update_rprompt () {
  RPROMPT=$(print "%{\e[34m%}[ %(5~,%-2~/.../%2~,%~) %{\e[32m%}$VCS_STAT%{\e[34m%} ]%{\e[m%}" )
}

_show_dirname_on_tmux_window_name () {
  tmux rename-window $(basename $(pwd))
}

_update_rprompt

if [ "$TERM" = "screen" ]; then
  preexec() {
    local -a cmd; cmd=(${(z)2})
    if test "$cmd[1]" = "s"
    then
        shift $cmd;
    fi
    case $cmd[1] in
        ssh)
            prefix=$(echo "$cmd[2]" | cut -d'.' -f1)
            if test "$prefix" = "192"
            then
                tmux rename-window $(echo "$cmd[2]" | cut -d'.' -f4)
            else
                tmux rename-window $cmd[2]
            fi
            ;;
        ghq)
            if test "$cmd[2]" = "look"
            then
                tmux rename-window $(basename $cmd[3])
            fi

    esac

    if test $USE_VCS_INFO
    then
        _set_env_vcs_stat
    fi
  }
  precmd() {
    if test $USE_VCS_INFO
    then
        _set_env_vcs_stat
    else
        _set_env_git_current_branch
    fi
    _update_rprompt
  }

  chpwd () {
    _show_dirname_on_tmux_window_name
    _update_rprompt
  }
fi

