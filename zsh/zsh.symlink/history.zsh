# history

# sets the location of the history file
HISTFILE=${HOME}/.zhistory
setopt APPEND_HISTORY
#
# limit of history entries
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_EXPIRE_DUPS_FIRST

# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
# ‘: <beginning time>:<elapsed seconds>;<command>’.
setopt EXTENDED_HISTORY

#
# Shares history across all sessions rather than waiting for a new shell invocation to read the history file.
setopt SHARE_HISTORY
