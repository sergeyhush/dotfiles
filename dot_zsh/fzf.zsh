fzf-binds() {
        printf 'ctrl-v:execute(less -K {}),'
        printf 'ctrl-e:execute(${EDITOR:-nvim} {} < /dev/tty > /dev/tty)+abort,'
        printf 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'
        printf 'ctrl-r:execute-silent(realpath {} | xargs echo -n | pbcopy)'
}
export FZF_DEFAULT_OPTS="--bind '$(fzf-binds)'"

# This is the same functionality as fzf's ctrl-t, except that the file or
# directory selected is now automatically cd'ed or opened, respectively.
fzf-open-file-or-dir() {
  local cmd="command find -L . \
    \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  local out=$(eval $cmd | fzf-tmux --exit-0)

  if [ -f "$out" ]; then
    $EDITOR "$out" < /dev/tty
  elif [ -d "$out" ]; then
    cd "$out"
    zle reset-prompt
  fi
}
zle     -N   fzf-open-file-or-dir
bindkey '^P' fzf-open-file-or-dir

if (( $+commands[fd] )); then
  export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git . $HOME/work/src"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd -t d --hidden --follow --exclude \".git\" . $HOME/work/src"
fi
