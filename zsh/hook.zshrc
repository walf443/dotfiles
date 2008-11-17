# vim:ft=zsh:

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
    %*)
        cmd=(builtin jobs -l $cmd[1])
        ;;
    cd,vi,git)
        if (( $#cmd == 2)); then
            cmd[1]=$cmd[2]
        fi
        ;&
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

_show_dirname_on_screen_title();

if [ "$TERM" = "screen" ]; then
  preexec() {
    _show_cmd_on_screen_title;
  }

  precmd() {
    _show_dirname_on_screen_title;
  }

  function chpwd () {
    _show_dirname_on_screen_title;
  }
fi

