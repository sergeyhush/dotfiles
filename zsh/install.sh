#!/bin/sh

ZSH_DIR=$HOME/.zsh
mkdir -p "$ZSH_DIR"
for repo in zsh-autosuggestions zsh-syntax-highlighting; do
    if [ ! -d "$ZSH_DIR/$repo" ]; then
        git clone https://github.com/zsh-users/$repo "$ZSH_DIR/$repo"
    fi
done

if [ ! -d "ZSH_DIR/zplug" ]; then
    git clone https://github.com/zplug/zplug "$ZSH_DIR/zplug"
fi
