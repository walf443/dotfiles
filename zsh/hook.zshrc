# vim:ft=zsh:

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%s[%b]'
zstyle ':vcs_info:*' actionformats '%s[%b|%a]'

_show_cmd_on_screen_title() {
  local -a cmd; cmd=(${(z)2})
  case $cmd[1] in
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

_set_env_vcs_stat() {
    VCS_STAT=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && VCS_STAT="$vcs_info_msg_0_"
}

_update_rprompt () {
  RPROMPT=$(print "%{\e[34m%}[ %(5~,%-2~/.../%2~,%~) %{\e[32m%}$VCS_STAT%{\e[34m%} ]%{\e[m%}" )
}

_update_rprompt

if [ "$TERM" = "screen" ]; then
  preexec() {
    _set_env_vcs_stat
  }
  precmd() {
    _show_dirname_on_screen_title
    _set_env_vcs_stat
    _update_rprompt
  }

  chpwd () {
    _show_dirname_on_screen_title
    _update_rprompt
  }
fi

