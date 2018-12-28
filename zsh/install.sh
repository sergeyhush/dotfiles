#!/bin/sh
echo "> ZSH installation"

case "$(uname -s)" in
    Darwin*)
        sudo dscl . -create "/Users/$USER" UserShell /usr/local/bin/zsh;;
    Linux*)
        sudo chsh -s $(which zsh) $USER;;
esac

ZSH_DIR=$HOME/.zsh
if [ ! -d $ZSH_DIR/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_DIR/zsh-autosuggestions
fi
if [ ! -d $ZSH_DIR/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_DIR/zsh-syntax-highlighting
fi
