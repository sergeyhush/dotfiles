# set -x fish_trace 1

# homebrew
set -gx HOMEBREW_NO_EMOJI 1
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew

set -U fish_greeting # disable greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set TERM xterm-256color
set -gx AWS_PAGER ""
# # fzf
fzf_configure_bindings --directory=\ct --processes=\ck
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

# PATH setup
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOMEBREW_PREFIX/bin
fish_add_path $HOMEBREW_PREFIX/sbin
fish_add_path /usr/local/bin

if status is-interactive
    safe_exec mise "mise activate fish | source"
    if not set -q NO_FANCY_PROMPT
        safe_exec starship "starship init fish | source"
        safe_exec zoxide "zoxide init fish | source"
        safe_exec atuin "atuin init fish --disable-up-arrow | source"
        safe_exec carapace "carapace _carapace | source"
    end

    # sfid - moved inside is-interactive check for performance
    safe_exec sf 'eval "\$(sf aliases --fish-shell)"'
end

fish_config theme choose "Catppuccin Mocha"
