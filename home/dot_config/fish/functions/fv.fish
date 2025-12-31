function fv
    fd --type f --hidden --follow --exclude .git | fzf-tmux -p --reverse | xargs nvim
end
