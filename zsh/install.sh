#!/bin/sh
echo "> ZSH installation"

case "$(uname -s)" in
    Darwin*)
        sudo dscl . -create "/Users/$USER" UserShell /usr/local/bin/zsh;;
    Linux*)
        sudo chsh -s $(which zsh) $USER;;
esac

ZSH_DIR=$HOME/.zsh
mkdir -p "$ZSH_DIR"
for repo in zsh-autosuggestions zsh-syntax-highlighting; do
    if [ ! -d "$ZSH_DIR/$repo" ]; then
        git clone https://github.com/zsh-users/$repo "$ZSH_DIR/$repo"
    fi
done
