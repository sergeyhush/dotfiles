export DOTFILES="${"${(%):-%N}":A:h:h}"
export ZSH_HOME="$HOME/.zsh"
export ZPLUG_HOME="$HOME/.zsh/zplug"
# export FZF_BASE="/usr/local/opt/fzf"

# load zsh config files
config_files=(~/.zsh/*.zsh(N))
for file in ${config_files}
do
  source $file
done

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/**/*.zsh)

# load the path files first
for file in ${(M)config_files:#*/path.zsh}
do
    source "$file"
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
    source "$file"
done

for file in ${(M)config_files:#*/completion.zsh}
do
    source "$file"
done

unset config_files

source "$ZPLUG_HOME/init.zsh"

zplug "clvv/fasd",              as:command, use:fasd
zplug "plugins/z",              from:oh-my-zsh
zplug "plugins/fancy-ctrl-z",   from:oh-my-zsh
zplug "plugins/pyenv",          from:oh-my-zsh, if:"(( $+commands[pyenv] ))"
zplug "mafredri/zsh-async",     from:github, defer:0
zplug "djui/alias-tips"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "plugins/tmux",      from:oh-my-zsh

# fzf
zplug 'junegunn/fzf', \
    as:command, \
    use:'bin/{fzf,fzf-tmux}', \
    if:"[[ $OSTYPE == linux* || $OSTYPE == darwin* ]]", \
        hook-build:'./install --key-bindings --completion --no-update-rc'

zplug "junegunn/fzf", from:github, use:"shell/completion.zsh"
zplug "junegunn/fzf", from:github, use:"shell/key-bindings.zsh"

zplug check || zplug install
zplug load


# =============================================================================
#                                   Startup
# =============================================================================
if zplug check 'zsh-users/zsh-syntax-highlighting'; then
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
fi

if zplug check 'plugins/tmux'; then
    ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_AUTOSTART_ONCE=true
fi

if zplug check 'denysdovhan/spaceship-prompt'; then
    SPACESHIP_PROMPT_ORDER=(
        time
        # user
        # host
        dir
        git
        # golang
        # docker
        # venv
        # pyenv
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
fi

# change the prompt success color
zstyle :prompt:pure:prompt:success color white

fpath=("$HOME/bin" $fpath)

export EDITOR='nvim'

[ -f ~/.localrc ] && source ~/.localrc
