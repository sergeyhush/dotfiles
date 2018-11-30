#!/bin/sh

echo "> Install Mutt"
MUTTDIR="${HOME}/.mutt"
COLORSDIR="${MUTTDIR}/colors"
if [ ! -d "${COLORSDIR}" ]; then
    git clone https://github.com/altercation/mutt-colors-solarized "${COLORSDIR}"
fi
