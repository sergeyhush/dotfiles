if [[ "$OSTYPE" != darwin* ]]; then
    return 1
fi

# Flush DNS cache
alias flushdns="dscacheutil -flushcache"
# # Aggressively flush DNS cache
alias killdns="sudo killall -HUP mDNSResponder"
