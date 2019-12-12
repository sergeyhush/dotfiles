DEFAULT_SESSION='dev'

# Only run if tmux is actually installed
if which tmux &> /dev/null
then
    if [[ -z "$TMUX" && -z "$INSIDE_EMACS" && -z "$EMACS" && -z "$VIM" ]]; then
        tmux attach-session -d -t $DEFAULT_SESSION || tmux new-session -s $DEFAULT_SESSION
    fi
fi
