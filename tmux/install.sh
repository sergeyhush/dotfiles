#!/bin/sh
# Install Tmux Plugin Manager https://github.com/tmux-plugins/tpm
echo '> TMUX TPM installation'

TPMDIR="${HOME}/.tmux/plugins/tpm"
if [ ! -d "$TPMDIR" ]; then
    mkdir -p "$TPMDIR"
    git clone https://github.com/tmux-plugins/tpm "$TPMDIR"
fi
