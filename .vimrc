set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('ctrlpvim/ctrlp.vim')

call dein#end()


filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile

" press <C-]> to open tag in new tab
nnoremap <silent><C-]> <C-w><C-]><C-w>T

" Mouse
set mouse=a

" Line number
set number

" NERDTree
autocmd VimEnter * execute 'NERDTree'
let g:NERDTreeShowBookmarks=1
let NERDTreeShowHidden = 1
nnoremap <silent><C-e> :NERDTreeFocusToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CtrlP
let g:ctrlp_max_files = 100000
let g:ctrlp_custom_ignore = '*.\.o\|\.git'
