fzf-binds() {
        printf 'ctrl-v:execute(less -K {}),'
        printf 'ctrl-e:execute(${EDITOR:-nvim} {} < /dev/tty > /dev/tty)+abort,'
        printf 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'
        printf 'ctrl-r:execute-silent(realpath {} | xargs echo -n | pbcopy)'
}
export FZF_DEFAULT_OPTS="--bind '$(fzf-binds)'"
