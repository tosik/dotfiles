" vundles
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'vim-scripts/desert256.vim'
Bundle 'railscasts'

Bundle 'kchmck/vim-coffee-script'
Bundle 'Textile-for-VIM'
Bundle 'JavaScript-syntax'
Bundle 'itspriddle/vim-javascript-indent'
"Bundle 'rails.vim'
Bundle 'vim-ruby/vim-ruby'

Bundle 'motemen/git-vim.git'
Bundle 'Shougo/unite.vim'
Bundle 'https://github.com/Sixeight/unite-grep.git'
Bundle 'https://github.com/Shougo/vimproc.git'
Bundle 'Shougo/neocomplcache'
Bundle 'The-NERD-Commenter'


" filetypes
filetype on
filetype indent on
filetype plugin on
au FileType ruby set ts=2 sw=2 expandtab
au FileType c set ts=4 sw=4 sts=0
au FileType cpp set ts=4 sw=4 sts=0
au FileType php set ts=4 sw=4 sts=0
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab


" help
helptags $HOME/.vim/doc
set helplang=ja,en


" printer
set printoptions=header:0,left:10pt


syntax on



" colorscheme
colorscheme desert
"colorscheme railscasts



" options
set number
set wrapscan
set wildmode=list:longest
nmap ,e :execute '!' &ft ' %'<CR>
set hidden
set autoread
set smartindent
set ignorecase
set smartcase
set nolist
set showcmd
set showmatch
set laststatus=2
set incsearch
set nohlsearch
set nobackup
set backspace=2
set cursorline
set cursorcolumn

set shell=/bin/sh


" key binding
nmap j gj
nmap k gk
vmap j gj
vmap k gk

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

cnoremap <C-p> <up>
cnoremap <C-n> <down>

"nnoremap <silent> <C-w><C-+> :<C-u>resize +1<CR>
"nnoremap <silent> <C-w><C--> :<C-u>resize -1<CR>
nmap - :resize -1<CR>
nmap + :resize +1<CR>
nmap < :vertical resize +1<CR>
nmap > :vertical resize -1<CR>

" enable NeoComplCache
let g:neocomplcache_enable_at_startup = 1


" unite
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uu :<C-u>UniteWithCurrentDir file<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files -start-insert file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru -start-insert<CR>
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap ,ug :Unite grep::-iHRn<CR>/**/*
nnoremap <silent> ,ur :<C-u>UniteResume<CR>
nnoremap <silent> <C-e> :<C-u>Unite file_rec/async -start-insert<CR>
vnoremap ,g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>/**/*
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-h> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')


" ruby rails
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1


" nerd commenter
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle


" statusline
if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=\ %l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=\ %l,%c%V%8P
endif


" white-space highlight
highlight SpecialKey guibg=#222222 cterm=underline ctermfg=darkgrey
set list
set listchars=tab:\ \ ,extends:<,trail:\ 


" rspecs
nmap ,r :call RSpecLine() <CR>
nmap ,R :call RSpecAll() <CR>
nmap ,j :call JasmineLine() <CR>
nmap ,J :call JasmineAll() <CR>

" vim-rspec
function! RSpecLine()
  execute '! zsh -c ". $rvm_path/scripts/rvm; bundle exec rspec -O ~/.rspec --backtrace -X % -l '.line('.').'"'
endfunction
function! RSpecAll()
  execute '! zsh -c ". $rvm_path/scripts/rvm; bundle exec rspec -O ~/.rspec --backtrace -X %"'
endfunction
function! JasmineLine()
  execute '! zsh -c ". $rvm_path/scripts/rvm; bundle exec jasmine-headless-webkit %"'
endfunction
function! JasmineAll()
  execute '! zsh -c ". $rvm_path/scripts/rvm; bundle exec jasmine-headless-webkit"'
endfunction
" git blame
function! GitBlame()
  execute '! zsh -c "git blame %"'
endfunction


