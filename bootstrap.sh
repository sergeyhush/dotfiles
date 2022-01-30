#!/usr/bin/env bash
set -euo pipefail

if ! command -v chezmoi &>/dev/null; then
    curl --fail --location --silent https://git.io/chezmoi | BINDIR="$HOME/bin" sh
    sudo mv "$HOME"/bin/chezmoi /usr/local/bin
fi

chezmoi init sergeyhush --apply --force --branch chezmoi
