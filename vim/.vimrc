" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
" Basic {
set nocompatible              " be iMproved, required
set encoding=utf-8
" }

" Auto-install vim-plug {
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }
"

" Vim plugins {
call plug#begin('~/.vim/plugged')

    " General {
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-function'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'w0rp/ale'
    Plug 'wellle/targets.vim'
    Plug 'editorconfig/editorconfig-vim'
    " Still testing out
    Plug 'mbbill/undotree'
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/goyo.vim'
    Plug 'tpope/vim-obsession'
    " Rarely used
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'junegunn/vim-easy-align'
    Plug 'easymotion/vim-easymotion'
    " Plug 'terryma/vim-expand-region'
    " Plug 'terryma/vim-multiple-cursors'
    " Plug 'tpope/vim-vinegar'
    " }

    " Colors {
    Plug 'altercation/vim-colors-solarized'
    Plug 'blueyed/vim-diminactive'
    Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'morhetz/gruvbox'
    Plug 'tomasiser/vim-code-dark'
    " }

    " Git {
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-git'
    " }

    " Python {
    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    " Plug 'jeetsukumaran/vim-pythonsense', { 'for': 'python' }
    " }

    " Golang {
    Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
    Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
    " }

    " Terraform {
    Plug 'hashivim/vim-terraform', { 'for': ['terraform'] }
    Plug 'juliosueiras/vim-terraform-completion'
    " }
call plug#end()
"}

" General {
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
    " }
" }

" Vim UI {
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line   "
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace                "

if has('statusline')
    set laststatus=2

    set statusline =%#identifier#
    set statusline+=[%t]    "tail of the filename
    set statusline+=%*
    "display a warning if fileformat isnt unix
    set statusline+=%#warningmsg#
    set statusline+=%{&ff!='unix'?'['.&ff.']':''}
    set statusline+=%*

    "display a warning if file encoding isnt utf-8
    set statusline+=%#warningmsg#
    set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
    set statusline+=%*

    set statusline+=%h      "help file flag
    set statusline+=%y      "filetype

    "read only flag
    set statusline+=%#identifier#
    set statusline+=%r
    set statusline+=%*

    "modified flag
    set statusline+=%#identifier#
    set statusline+=%m
    set statusline+=%*

    set statusline+=%{fugitive#statusline()}

    set statusline+=%=      "left/right separator
    set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
    set statusline+=%c,     "cursor column
    set statusline+=%l/%L   "cursor line/total lines
    set statusline+=\ %P    "percent through file
endif

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" }

" Formatting {
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current         "

" }

" FILETYPES  {{{ ==============================================================

" JSON {{{ -------------------------------------------------------------------
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END
" }}}


" Key Mappings {

" change the mapleader from \ to <space>
let mapleader = "\<Space>"

" Leader most frequent actions
" - save file
nnoremap <Leader>w :w<CR>

" Enable folding with the spacebar
" nnoremap <space> za


nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

nmap <silent> ,/ :nohlsearch<CR>

" In case you forget sudo, write to file anyways
cmap w!! w !sudo tee % >/dev/null

" Make 'jk' act as Escape
imap jk <Esc>

nnoremap <silent><leader>t :TagbarToggle<CR>
" Get used to Ctrl-O and Ctrl-I instead
" map <Leader><Tab> :bprevious<CR>
" nnoremap <Tab> :bnext<CR>
" nnoremap <S-Tab> :bprevious<CR>
nmap <Leader>/ :Ag<Space>
nmap <Leader>b :Buffers<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>q :q<CR>
nmap <Leader>s :Filetypes<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>


" Ale quick error/warning navigation
nmap <silent> ]g <Plug>(ale_previous_wrap)
nmap <silent> [g <Plug>(ale_next_wrap)]
" }

" GUI {
if $TERM == "xterm"
    set t_Co=256              " 256 colors
endif
" }
"

" Which-key Config {
let g:which_key_map = {}
let g:maplocalleader = ','
set timeoutlen=500

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')


nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>


let g:which_key_map.e = {
            \ 'name' : '+errors'                              ,
            \ 'n' : ['<Plug>(ale_next)'     , 'next-error']     ,
            \ 'p' : ['<Plug>(ale_previous)' , 'previous-error'] ,
            \ }

let g:which_key_map.f = {
            \ 'name' : '+find/files/fold' ,
            \ '0' : ['set foldlevel=0'    , '0-fold-level']                    ,
            \ '1' : ['set foldlevel=1'    , '1-fold-level']                    ,
            \ '2' : ['set foldlevel=2'    , '2-fold-level']                    ,
            \ '3' : ['set foldlevel=3'    , '3-fold-level']                    ,
            \ '4' : ['set foldlevel=4'    , '4-fold-level']                    ,
            \ '5' : ['set foldlevel=5'    , '5-fold-level']                    ,
            \ '6' : ['set foldlevel=6'    , '6-fold-level']                    ,
            \ '7' : ['set foldlevel=7'    , '7-fold-level']                    ,
            \ '8' : ['set foldlevel=8'    , '8-fold-level']                    ,
            \ '9' : ['set foldlevel=9'    , '9-fold-level']                    ,
            \ 'b' : ['BLines'             , 'fzf-find-current-buffer']         ,
            \ 'f' : ['Files ~'            , 'files-in-home-direcotry']         ,
            \ 's' : ['save'               , 'save-file']                       ,
            \ '?' : ['Files'              , 'files-in-current-direcotry']      ,
            \ 'R' : ['source $MYVIMRC'    , 'reload-vimrc']                    ,
            \ }


" }

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" UI {
" syntax highlight on
set t_Co=256
set t_ut=
syntax enable
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
set background=dark
colorscheme codedark
" }

" Save all on lost focus
au FocusLost * :wa

" Plugin options {
    " vim-gutentags {
    let g:gutentags_cache_dir = expand('~/.cache/vim/tags')
    let g:gutentags_generate_on_new = 1
    let g:gutentags_generate_on_missing = 1
    let g:gutentags_generate_on_write = 1
    let g:gutentags_generate_on_empty_buffer = 0
    " }

    " vim-easy-align {
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    " }

    " vimux {
    " Prompt for a command to run
    map <Leader>vp :VimuxPromptCommand<CR>
    " }

    " ag {
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
    " }

    " Ale {
    let b:ale_linters = {
    \ 'python': ['flake8', 'mypy', 'pylint'],
    \ 'go': ['go', 'golint', 'errcheck']
    \}
    let g:ale_fixers = {
    \ 'python': ['black', 'isort'],
    \ 'json': ['jq']
    \}
    " Disabling highlighting
	let g:ale_set_highlights = 0

	" Only run linting when saving the file
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_lint_on_enter = 0

    nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>
    noremap <Leader>gd :ALEGoToDefinition<CR>
    noremap <Leader>lf :ALEFix<CR>
    noremap <Leader>gr :ALEFindReferences<CR>
    " }

    " vim-go {
    let g:go_fmt_command = "goimports""
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    " }

    " Pymode {
    if !has('python') && !has('python3')
        let g:pymode = 0
    else
        let g:pymode = 1
        let g:pymode_lint = 1
        let g:pymode_rope = 0
        let g:pymode_rope_lookup_project = 0
        let g:pymode_rope_autoimport = 0
        let g:pymode_doc = 1
        let g:pymode_virtualenv = 1
        let g:pymode_lint_ignore = "E501"
        let g:pymode_python = 'python3'
    endif
    " }

    " indent-guides {
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_color_change_percent = 5
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey ctermbg=8
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=61
    autocmd VimEnter * :IndentGuidesEnable
    " }

    " Autoformat {
    " au BufWrite * :Autoformat
    " }
    "
    " add yaml stuffs {
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2
    " }

    " CoC {
    let g:coc_global_extensions = ['coc-tsserver']
    " }
" }