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
nmap <Leader>/ :Rg<Space>
nmap <Leader>b :Buffers<CR>
nmap <Leader>c :Commands<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>q :q<CR>
nmap <Leader>s :Filetypes<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" ==== vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ==== vimux
