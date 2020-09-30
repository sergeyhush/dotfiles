# use bare zsh for VSCode
if [[ "$TERM_PROGRAM" = "vscode" ]]; then
    exit 0
fi

fpath=($HOME/.zsh/functions $fpath)
autoload -U $fpath[1]/*(.:t)

# load zsh config files
config_files=(~/.zsh/*.zsh(N))
for file in ${config_files}
do
  source $file
done
unset config_files


[ -f ~/.localrc ] && source ~/.localrc
