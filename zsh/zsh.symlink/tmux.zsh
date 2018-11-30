# Aliases
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'

DEFAULT_SESSION='dsession'

# Only run if tmux is actually installed
if which tmux &> /dev/null
then
    if [[ -z "$TMUX" && -z "$INSIDE_EMACS" && -z "$EMACS" && -z "$VIM" ]]; then
        tmux attach-session -t $DEFAULT_SESSION || tmux new-session -s $DEFAULT_SESSION
    fi
fi
