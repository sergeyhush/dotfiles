if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    set grepprg=ag\ --nogroup\ --nocolor

    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

