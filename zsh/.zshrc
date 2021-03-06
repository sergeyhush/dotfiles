# zmodload zsh/zprof

# use bare zsh for VSCode
if [[ "$TERM_PROGRAM" = "vscode" ]]; then
    exit 0
fi

fpath=(~/.zsh/functions ~/.zsh/zsh-completions/src $fpath)

autoload -Uz compinit promptinit
compinit
promptinit

# =============================================================================
# Plugins
# =============================================================================
plugins=(
    ~/.zsh/alias-tips/alias-tips.plugin.zsh
    ~/.zsh/ohmyzsh/lib/directories.zsh
    ~/.zsh/ohmyzsh/plugins/dotenv/dotenv.plugin.zsh
    ~/.zsh/ohmyzsh/plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
    ~/.zsh/ohmyzsh/plugins/fzf/fzf.plugin.zsh
    ~/.zsh/ohmyzsh/plugins/golang/golang.plugin.zsh
    ~/.zsh/ohmyzsh/plugins/pyenv/pyenv.plugin.zsh
    ~/.zsh/ohmyzsh/plugins/tmux/tmux.plugin.zsh
    ~/.zsh/ohmyzsh/plugins/z/z.plugin.zsh
    ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
)

# =============================================================================
# Plugins config
# =============================================================================
typeset -gA ZSH_HIGHLIGHT_STYLES ZSH_HIGHLIGHT_PATTERNS

ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='none'
ZSH_HIGHLIGHT_STYLES[commandseparator]='none'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=green'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=red'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='none'

ZSH_TMUX_AUTOSTART=true

SPACESHIP_PROMPT_ORDER=(
    time
    dir
    git
    exec_time
    line_sep
    jobs
    exit_code
    char
)

SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
# SPACESHIP_DIR_TRUNC='3' # show only last directory

SPACESHIP_DOCKER_PREFIX="docker:("
SPACESHIP_DOCKER_SUFFIX=") "
SPACESHIP_DOCKER_SYMBOL=""

SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
SPACESHIP_GIT_PREFIX='git:('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_SYMBOL="" # disable git prefix

SPACESHIP_GOLANG_PREFIX="go:("
SPACESHIP_GOLANG_SUFFIX=") "
SPACESHIP_GOLANG_SYMBOL=""

SPACESHIP_HOST_PREFIX="@:(" # Result will look like this: username@:(hostname)
SPACESHIP_HOST_SUFFIX=") "

SPACESHIP_PYENV_PREFIX="python:("
SPACESHIP_PYENV_SUFFIX=") "
SPACESHIP_PYENV_SYMBOL=""

SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host

SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "

# =============================================================================
# Other configs
# =============================================================================
for file in ${plugins}
do
    source $file
done
unset plugins

config_files=(~/.zsh/*.zsh(N))
for file in ${config_files}
do
  source $file
done
unset config_files

# Default theme
prompt spaceship

[ -f ~/.localrc ] && source ~/.localrc

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zprof
