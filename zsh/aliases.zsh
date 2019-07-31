# aliases

alias reload!='. ~/.zshrc'
alias syncwork='rsync -avze ssh ~/work/licenseing monster-01.cumulus:work/'
alias dhcpon='sudo /bin/launchctl load -w /System/Library/LaunchDaemons/bootps.plist'
alias dhcpoff='sudo /bin/launchctl unload -w /System/Library/LaunchDaemons/bootps.plist'
alias jcli="java -jar ~/bin/jenkins-cli.jar -s $CI_SERVER_URL_WITH_U_P"
alias flushdns="dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias play="ANSIBLE_HOST_KEY_CHECKING=False ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null' ansible-playbook"

alias "cd.."="cd ../"
alias v="nvim"
alias vi="nvim"
alias e='emacsclient -n -c -a "" -- "$@"'

#ls
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias ll='ls -l'      #long list

alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g B="| bat"
