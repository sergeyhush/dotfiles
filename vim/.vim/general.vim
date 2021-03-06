set nocompatible              " be iMproved, required
set encoding=utf-8
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8    "
set autowrite                 " write content on :make
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator         "
set visualbell           " don't beep
set noerrorbells         " don't beep
" tabs and spaces handling
set copyindent
set smarttab

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
    if $TMUX == ''
        set clipboard=unnamed
    endif
endif
" }
" Setup backup {
set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif   "

function! InitializeDirectories()
    let parent = $HOME
    let prefix = '.vim'
    let common_dir = parent . '/'. prefix
    let dir_list = {
                \ 'backup_files': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap_files': 'directory' }

    if has('persistent_undo')
        let dir_list['undo_files'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . '/' . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory, "p")
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif")
    endfor
endfunction
call InitializeDirectories()

tnoremap <Esc> <C-\><C-n>
