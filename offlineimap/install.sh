#!/bin/sh

echo "> Offlineimap installation"
pip install --quiet --user keyring
echo "import keyring" > "$HOME/.offlineimap.py"
