if &compatible
      set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('rking/ag.vim')
call dein#add('rhysd/vim-clang-format')
call dein#add('kana/vim-operator-user')
call dein#add('justmao945/vim-clang')

call dein#end()

filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
syntax on

set encoding=utf-8

nnoremap ,x :ClangFormat<CR>

" Mouse
set mouse=a

" Line number
set number

" Search
set ignorecase
set smartcase

" auto-reload
set autoread

" command compl
set wildmenu wildmode=list:longest,full

" NERDTree
"autocmd VimEnter * execute 'NERDTree'
let g:NERDTreeShowBookmarks=1
let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP
let g:ctrlp_max_files = 100000
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,obj/*,*.o,bin/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|meta|prefab)$',
  \ }


"----------------------------------------------------
" Insert include guard to the current file
"----------------------------------------------------
command!  -nargs=0 IncGuard call IncludeGuard()
function! IncludeGuard()
    "カレントファイル名を取得
    let name = fnamemodify(expand('%'),':t')

    "大文字にする
    let name = toupper(name)

    "がーど
    let included = substitute(name,'\.','_','g').'_'

    "書き込み
    let res_head = '#ifndef _'.included."\n#define _".included."\n\n"
    let res_foot = "\n\n".'#endif'
    silent! execute '1s/^/\=res_head'
    silent! execute '$s/$/\=res_foot'
endfunction

" Header and source switcher
nnoremap ,c :e %<.cpp<CR>
nnoremap ,h :e %<.h<CR>

" generate tags
nnoremap ,g :!ctags<CR>
