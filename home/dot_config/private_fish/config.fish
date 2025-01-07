fish_add_path /usr/local/bin
fish_add_path $HOME/bin

# homebrew
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/binutils/bin
set -gx HOMEBREW_NO_EMOJI 1
set -gx HOMEBREW_NO_ANALYTICS 1
if status is-interactive
    eval (/opt/homebrew/bin/brew shellenv)
end

set -U fish_greeting # disable greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim
set -Ux VISUAL nvim

set TERM xterm-256color
set -gx AWS_PAGER ""

# fzf
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

#Golang
fish_add_path $HOME/go/bin
fish_add_path /usr/local/go/bin

#Pyenv
if type -q pyenv
    status --is-interactive; and source (pyenv init -|psub)
end

set fish_tmux_autostart true

source ~/.config/fish/aliases.fish
source ~/.docker/init-fish.sh || true # Added by Docker Desktop
source ~/.config/fish/private.fish || true

starship init fish | source
if status is-interactive
    zoxide init fish | source
end

alias v nvim
alias vim nvim
alias vi nvim
