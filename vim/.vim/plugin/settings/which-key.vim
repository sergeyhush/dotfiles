let g:which_key_map = {}
let g:maplocalleader = ','
set timeoutlen=500

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

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
