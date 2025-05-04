#!/usr/bin/env bash
set -exuo pipefail

# Source: https://discuss.circleci.com/t/brew-link-step-failing-on-python-dependency/33925/8?u=ashishb
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Chezmoi
if ! command -v chezmoi &>/dev/null; then
    curl --fail --location --silent https://git.io/chezmoi | BINDIR="$HOME/bin" sh
    sudo mv "$HOME"/bin/chezmoi /usr/local/bin
fi
chezmoi init sergeyhush --apply --force --branch chezmoi

# Homebrew
if ! command -v brew &>/dev/null 2>&1; then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew analytics off
brew bundle --global
brew cleanup
