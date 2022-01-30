#!/usr/bin/env bash
set -euo pipefail
set -x

if test "${CI:-}"; then
    set -x # For better debugging
    # Source: https://discuss.circleci.com/t/brew-link-step-failing-on-python-dependency/33925/8?u=ashishb
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

# Homebrew
if ! command -v brew &>/dev/null 2>&1; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew analytics off
brew update
# Install packages
brew cleanup || true

# Chezmoi
if ! command -v chezmoi &>/dev/null; then
    curl --fail --location --silent https://git.io/chezmoi | BINDIR="$HOME/bin" sh
    sudo mv "$HOME"/bin/chezmoi /usr/local/bin
fi
chezmoi init sergeyhush --apply --force --branch chezmoi
