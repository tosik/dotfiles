"----------------------------------------------------
" Plugins
"----------------------------------------------------
call plug#begin('~/.vim/plugged')
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'mattn/vim-lsp-settings'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'dense-analysis/ale'
  Plug 'buoto/gotests-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'scrooloose/nerdtree'
call plug#end()


"----------------------------------------------------
" General settings
"----------------------------------------------------
filetype plugin indent on
syntax enable
set expandtab
set tabstop=2
set shiftwidth=2
set noswapfile
set mouse=a
set number
set autoread
set wildmenu wildmode=list:longest,full
set laststatus=2
set encoding=utf-8
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*/obj/*,*.dep,*.o,*/bin/*,*/build/*,*.ttf
set ignorecase
set smartcase


"----------------------------------------------------
" Clang
"----------------------------------------------------

" Insert include guard to the current file
command!  -nargs=0 IncGuard call IncludeGuard()
function! IncludeGuard()
  let prefix  = '_INCLUDE_GUARD_UUID_'
  let uuid = substitute(system('uuidgen'),'\n','','g')
  let name = prefix.substitute(uuid,'-','_','g').'_'
  let included = toupper(name)
  let res_head = '#ifndef '.included."\n#define ".included."\n\n"
  let res_foot = "\n\n".'#endif'
  silent! execute '1s/^/\=res_head'
  silent! execute '$s/$/\=res_foot'
endfunction

" Header and source switcher
nnoremap ,c :e %<.cpp<CR>
nnoremap ,h :e %<.h<CR>

" check clang syntax
nnoremap ,s :ClangSyntaxCheck<CR>:w<CR>

" show current file path
nnoremap ,q :echo expand("%")<CR>

" Show definetion of function cousor word on quickfix
noremap <C-]> :<C-u>exe("Gtags ".expand('<cword>'))<CR>
" Show reference of cousor word on quickfix
noremap } :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>


"----------------------------------------------------
" optional command
"----------------------------------------------------
" highlight
nnoremap <C-e> :nohlsearch<CR>:set cul cuc<cr>:sleep 50m<cr>:set nocul nocuc<cr>/<BS>


"----------------------------------------------------
" lightline
"----------------------------------------------------
let g:lightline = {
  \ 'active': {
  \   'left': [ ['mode', 'paste'], ['readonly', 'filename', 'modified'], ['ale_message'] ]
  \ },
  \ 'component_expand': {
  \   'ale_message': 'LightlineAleMessage'
  \ },
  \ 'component_type': {
  \   'ale_message': 'error'
  \ }
  \ }
function! LightlineAleMessage() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.error == 0 ? '' : printf(
  \   '[Ale] %d errors',
  \   all_errors
  \)
endfunction
augroup AutoAleMessageGroup
  autocmd!
  autocmd User ALELintPost call lightline#update()
augroup END


"----------------------------------------------------
" CtrlP
"----------------------------------------------------
let g:ctrlp_max_files = 10000
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|tmp|log|node_modules$',
  \ 'file': '\v\.(exe|so|dll|meta|prefab)$',
  \ }

" ALE
let g:ale_lint_delay = 5000
let g:ale_linters = {
  \   'c' : ['clangd'],
  \   'cpp' : ['clangd'],
  \   'go' : ['golangci-lint', 'gofmt']
  \}


"----------------------------------------------------
" Go
"----------------------------------------------------
function AutoGoBuild()
  GoImports
  GoBuild
endfunction
autocmd BufWritePre,FileWritePre *.go call AutoGoBuild()


"----------------------------------------------------
" LSP
"----------------------------------------------------
autocmd BufWritePre <buffer> LspDocumentFormatSync
