#!/bin/sh

set -exu

stow -t ~ stow

PACKAGES="
ag \
ctags \
editorconfig \
fzf \
git \
golang \
intellij \
iterm2 \
java \
python \
nvim \
terraform \
tmux \
vim \
vscode \
zsh
"

for pkg in $PACKAGES; do
    stow "$pkg"
done
