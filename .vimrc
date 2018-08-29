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
set tabstop=2
set shiftwidth=2
set noswapfile
syntax on

set encoding=utf-8

nnoremap ,x :ClangFormat<CR>

let g:clang_cpp_options = '-std=c++14 -stdlib=libc++'
let g:clang_format_auto = 1
let g:clang_check_syntax_auto = 1
let g:clang_verbose_pmenu = 1
let g:clang_auto = 0

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,obj/*,*.dep,*.o,bin/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|meta|prefab)$',
  \ }


"----------------------------------------------------
" Insert include guard to the current file
"----------------------------------------------------
command!  -nargs=0 IncGuard call IncludeGuard()
function! IncludeGuard()
    let prefix  = '_INCLUDE_GUARD_UUID_'
    let uuid = substitute(system('uuidgen'),'\n','','g')
    let name = prefix.substitute(uuid,'-','_','g').'_'

    "大文字にする
    let included = toupper(name)

    "書き込み
    let res_head = '#ifndef '.included."\n#define ".included."\n\n"
    let res_foot = "\n\n".'#endif'
    silent! execute '1s/^/\=res_head'
    silent! execute '$s/$/\=res_foot'
endfunction

" Header and source switcher
nnoremap ,c :e %<.cpp<CR>
nnoremap ,h :e %<.h<CR>

" generate tags
nnoremap ,g :!ctags<CR>

" highlight
" <cr> should not only clear highlighted search, but flash the current
" cursor location.
nnoremap <CR> :nohlsearch<CR>:set cul cuc<cr>:sleep 50m<cr>:set nocul nocuc<cr>/<BS>

