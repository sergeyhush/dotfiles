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
" netrw {
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
" }
