fish_add_path $HOME/bin
fish_add_path $HOME/go/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/binutils/bin
fish_add_path /usr/local/bin
fish_add_path /usr/local/go/bin

set -gx HOMEBREW_NO_EMOJI 1
set -gx HOMEBREW_NO_ANALYTICS 1

set -U fish_greeting # disable greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim
set -Ux VISUAL nvim

set TERM xterm-256color
set -gx AWS_PAGER ""

# fzf
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

#Golang

#set fish_tmux_autostart true

if status is-interactive
    #Pyenv
    if type -q pyenv
        source (pyenv init -|psub)
    end
    eval (/opt/homebrew/bin/brew shellenv)
    starship init fish | source
    zoxide init fish | source
    atuin init fish --disable-up-arrow | source
end
