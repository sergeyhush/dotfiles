#!/bin/sh
EMACSD="$HOME/.emacs.d"
if [ ! -d "$EMACSD" ]; then
    git clone https://github.com/syl20bnr/spacemacs "$EMACSD"
fi
if ! command -v brew >/dev/null 2>&1; then
    brew tap caskroom/fonts
    brew cask install font-source-code-pro
    brew services start emacs-plus
fi
