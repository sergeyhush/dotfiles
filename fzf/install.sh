#!/bin/sh
echo "> FZF installation"

if ! command -v fzf >/dev/null 2>&1; then
    case "$(uname -s)" in
        Darwin*)
            brew install fzf;;
        Linux*)
            ;;
    esac
fi
