set -U fish_greeting
set TERM xterm-256color
set -gx EDITOR nvim
set fish_key_bindings fish_vi_key_bindings
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"


abbr v nvim

#Homebrew
set -gx HOMEBREW_NO_EMOJI 1
set -gx HOMEBREW_NO_ANALYTICS 1
eval "$(/opt/homebrew/bin/brew shellenv)"
fish_add_path /opt/homebrew/opt/binutils/bin
fish_add_path /opt/homebrew/opt/postgresql@11/bin
fish_add_path ~/work/src/ssudakovich/shell

#Golang
fish_add_path ~/go/bin

#Pyenv
if type -q pyenv
    status --is-interactive; and source (pyenv init -|psub)
end

source ~/.config/fish/aliases.fish
source ~/.docker/init-fish.sh || true # Added by Docker Desktop
source ~/.config/fish/private.fish || true

starship init fish | source
zoxide init fish | source
