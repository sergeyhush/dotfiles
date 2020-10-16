let configs = [
            \"general",
            \"plugins",
            \"plugin-settings",
            \"ui",
            \"formatting",
            \]
for file in configs
    let x = expand("~/.vim/".file.".vim")
    if filereadable(x)
        execute 'source' x
    endif
endfor
