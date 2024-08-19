#!/usr/bin/env bash
set -euo pipefail
set -x

if test "${CI:-}"; then
    set -x # For better debugging
    mkdir -p $HOME/.config/chezmoi/ $HOME/.local/share
    touch $HOME/.config/chezmoi/chezmoi.toml
    echo '[data]' >>$HOME/.config/chezmoi/chezmoi.toml
    echo 'email = "john.doe@example.com"' >>$HOME/.config/chezmoi/chezmoi.toml
    echo 'fullname = "John Doe"' >>$HOME/.config/chezmoi/chezmoi.toml
    # Source: https://discuss.circleci.com/t/brew-link-step-failing-on-python-dependency/33925/8?u=ashishb
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_INSTALL_CLEANUP=1
fi

# Chezmoi
if ! command -v chezmoi &>/dev/null; then
    curl --fail --location --silent https://git.io/chezmoi | BINDIR="$HOME/bin" sh
    sudo mv "$HOME"/bin/chezmoi /usr/local/bin
fi
chezmoi init sergeyhush --apply --force --branch chezmoi

# Homebrew
if ! command -v brew &>/dev/null 2>&1; then
    echo "Installing homebrew..."
    ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
fi
brew analytics off
brew bundle --global
brew cleanup || true
