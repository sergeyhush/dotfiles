# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/ssudakovich/.zsh/zplug/repos/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/ssudakovich/.zsh/zplug/repos/junegunn/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/ssudakovich/.zsh/zplug/repos/junegunn/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/ssudakovich/.zsh/zplug/repos/junegunn/fzf/shell/key-bindings.zsh"
