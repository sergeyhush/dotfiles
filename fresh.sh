#!/bin/bash

set -exu

# ensure brew is available
if ! command -v brew >/dev/null 2>&1; then
    echo "  Installing Homebrew for you."

    # Install the correct homebrew for each OS type
    if [[ $(uname) == 'Darwin' ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
fi
brew bundle --file ./homebrew/.Brewfile

# ensure stow is available
if ! command -v stow >/dev/null 2>&1; then
    echo "  Installing GNU Stow for you."

    if [[ $(uname) == 'Darwin' ]]; then
        brew install stow
    else
        echo 'Install stow'
        exit 1
    fi
fi
stow -t ~ stow
PACKAGES=(
    ag
    ctags
    editorconfig
    fzf
    git
    golang
    intellij
    iterm2
    java
    python
    nvim
    terraform
    tmux
    vim
    vscode
    zsh
)
for pkg in "${PACKAGES[@]}"; do
    stow "$pkg"
done
