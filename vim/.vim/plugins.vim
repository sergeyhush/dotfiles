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
    " Plug 'w0rp/ale'
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
