# vim:ft=zsh:

_set_env_git_current_branch() {
   GIT_CURRENT_BRANCH=$( git name-rev HEAD --name-only ) &> /dev/null
}

_show_cmd_on_screen_title() {
  local -a cmd; cmd=(${(z)2})
  case $cmd[1] in
    fg)
        if (( $#cmd == 1 )); then
            cmd=(builtin jobs -l %+)
        else
            cmd=(builtin jobs -l $cmd[2])
        fi
        ;;
    cd,vi)
        if (( $#cmd == 2)); then
            cmd[1]=$cmd[2]
            echo $cmd[1];
        fi
        ;;
    %*)
        cmd=(builtin jobs -l $cmd[1])
        ;;
    *)
        echo -n "k$cmd[1]:t\\"
        prev=$cmd[1]
        return
        ;;
  esac

  local -A jt; jt=(${(kv)jobtexts})

  $cmd >>(read num test
      cmd=(${(z)${(e):-\$jt$num}})
      echo -n "k$cmd[1]:t\\") 2>/dev/null

  prev=$cmd[1]
}

_show_dirname_on_screen_title() {
  echo -ne "\ek$(basename $(pwd))\e\\"
}

_update_rprompt () {
  RPROMPT=$(print "%{\e[34m%}[ %(5~,%-2~/.../%2~,%~) %{\e[32m%}$GIT_CURRENT_BRANCH%{\e[34m%} ]%{\e[m%}" )
}

_update_rprompt

if [ "$TERM" = "screen" ]; then
  preexec() {
    _show_cmd_on_screen_title;
  }

  precmd() {
    _show_dirname_on_screen_title;
    _set_env_git_current_branch
    _update_rprompt
  }

  chpwd () {
    _show_dirname_on_screen_title;
    _set_env_git_current_branch
    _update_rprompt
  }
fi

