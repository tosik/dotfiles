" vundles
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'vim-scripts/desert256.vim'

Bundle 'kchmck/vim-coffee-script'

Bundle 'JavaScript-syntax'
Bundle 'itspriddle/vim-javascript-indent'

Bundle 'motemen/git-vim.git'
Bundle 'Shougo/unite.vim'
Bundle 'https://github.com/Sixeight/unite-grep.git'
Bundle 'https://github.com/Shougo/vimproc.git'
Bundle 'Shougo/neocomplcache'


filetype on
filetype indent on
filetype plugin on
au FileType ruby set ts=2 sw=2 expandtab
au FileType c set ts=4 sw=4 sts=0
au FileType cpp set ts=4 sw=4 sts=0
au FileType php set ts=4 sw=4 sts=0
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

helptags $HOME/.vim/doc
set helplang=ja,en

let g:buftabs_only_basename=1


set printoptions=header:0,left:10pt


syntax on



colorscheme desert



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
"set cursorcolumn

set shell=/bin/sh

" binary mode -> vim -b  or  vim *.bin 
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END


imap <C-w> <C-x><C-o>

nmap j gj
nmap k gk
vmap j gj
vmap k gk

nmap ,y :YRShow<CR>

nnoremap ,1   :e #1<CR>
nnoremap ,2   :e #2<CR>
nnoremap ,3   :e #3<CR>
nnoremap ,4   :e #4<CR>
nnoremap ,5   :e #5<CR>
nnoremap ,6   :e #6<CR>
nnoremap ,7   :e #7<CR>
nnoremap ,8   :e #8<CR>
nnoremap ,9   :e #9<CR>

"noremap <Space> :bnext<CR>
"noremap <S-Space> :bprev<CR>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

cnoremap <C-p> <up>
cnoremap <C-n> <down>


" enable NeoComplCache
"let g:AutoComplPop_NotEnableAtStartup = 1
"let g:NeoComplCache_EnableAtStartup = 1

" unite
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" カレントディレクトリ一覧
nnoremap <silent> ,uu :<C-u>UniteWithCurrentDir file<CR>
" バッファのディレクトリ一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
"nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> ,ug :Unite grep:**/*:-iHRn<CR>
" 再帰的ファイル一覧
nnoremap <silent> ,ur :<C-u>Unite file_rec/async<CR>

nnoremap <silent> <C-e> :<C-u>Unite file_rec/async -start-insert<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-h> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')





if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

hi Pmenu ctermbg=4
hi PmenuSel ctermbg=1
hi PmenuSbar ctermbg=0
set completeopt=menuone


highlight SpecialKey guibg=#222222 cterm=underline ctermfg=darkgrey
set list
set listchars=tab:\ \ ,extends:<,trail:\ 


if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif




let g:miniBufExplMapWindowNavVim=1 "hjkl
let g:miniBufExplSplitBelow=0  " Put new window above
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1 
let g:miniBufExplSplitToEdge=1


function HtmlEscape() 
  silent s/&/\&amp;/eg 
  silent s/</\&lt;/eg 
  silent s/>/\&gt;/eg 
endfunction 
function HtmlUnEscape() 
  silent s/&lt;/</eg 
  silent s/&gt;/>/eg 
  silent s/&amp;/\&/eg 
endfunction 

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

