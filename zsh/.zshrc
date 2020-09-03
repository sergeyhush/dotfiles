# load zsh config files
config_files=(~/.zsh/*.zsh(N))
for file in ${config_files}
do
  source $file
done
unset config_files

[ -f ~/.localrc ] && source ~/.localrc
