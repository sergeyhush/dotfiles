function nocolor
    cat 1>| sed -e 's/\x1b\[[0-9;]*m//g'
end
