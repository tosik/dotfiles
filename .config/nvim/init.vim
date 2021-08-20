"----------------------------------------------------
" Plugins
"----------------------------------------------------
call plug#begin('~/.vim/plugged')
  "Plug 'prabirshrestha/async.vim'
  "Plug 'prabirshrestha/vim-lsp'
  "Plug 'prabirshrestha/asyncomplete.vim'
  "Plug 'prabirshrestha/asyncomplete-lsp.vim'
  "Plug 'mattn/vim-lsp-settings'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'buoto/gotests-vim'
  Plug 'mattn/vim-goimports'
  Plug 'itchyny/lightline.vim'
  "Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'rking/ag.vim'
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
  Plug 'mechatroner/rainbow_csv'
  Plug 'ruanyl/vim-gh-line'
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " colorschemes
  Plug 'altercation/vim-colors-solarized' " solarized
  Plug 'croaker/mustang-vim'              " mustang
  Plug 'jeffreyiacono/vim-colors-wombat'  " wombat
  Plug 'nanotech/jellybeans.vim'          " jellybeans
  Plug 'vim-scripts/Lucius'               " lucius
  Plug 'vim-scripts/Zenburn'              " zenburn
  Plug 'mrkn/mrkn256.vim'                 " mrkn256
  Plug 'jpo/vim-railscasts-theme'         " railscasts
  Plug 'therubymug/vim-pyte'              " pyte
  Plug 'tomasr/molokai'                   " molokai
  Plug 'chriskempson/vim-tomorrow-theme'  " tomorrow night
  Plug 'vim-scripts/twilight'             " twilight
  Plug 'w0ng/vim-hybrid'                  " hybrid
  Plug 'freeo/vim-kalisi'                 " kalisi
  Plug 'morhetz/gruvbox'                  " gruvbox
  Plug 'toupeira/vim-desertink'           " desertink
  Plug 'sjl/badwolf'                      " badwolf
  Plug 'itchyny/landscape.vim'            " landscape
  Plug 'joshdick/onedark.vim'             " onedark in atom
  Plug 'gosukiwi/vim-atom-dark'           " atom-dark
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
set clipboard=unnamed

colorscheme mustang


"----------------------------------------------------
" Python
"----------------------------------------------------


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
" CtrlP
"----------------------------------------------------
let g:ctrlp_max_files = 10000
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|tmp|node_modules$',
  \ 'file': '\v\.(exe|so|dll|meta|prefab|log)$',
  \ }


"----------------------------------------------------
" LSP
"----------------------------------------------------
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

let g:lsp_settings = {
\  'clangd': {'cmd': ['clangd', '-compile-commands-dir=build/debug']},
\}

"augroup AutoLsp
"  autocmd!
"  autocmd BufWritePre cpp,h,hpp,rb,go,vim :LspDocumentFormatSync
"augroup END
"nnoremap ,d :LspDefinition<CR>
"nnoremap ,r :LspReferences<CR>
"nnoremap ,i :LspImplementation<CR>
"nnoremap ,a :LspDocumentDiagnostics<CR>
"nnoremap ,t :LspRename<CR>

let g:coc_global_extensions=[ 'coc-omnisharp' ]
nmap <silent> ,d <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> ,i <Plug>(coc-implementation)
nmap <silent> ,r <Plug>(coc-references)
nmap <silent> ,t <Plug>(coc-rename)
nmap <silent> ,f <Plug>(coc-codeaction-selected)<down>
vmap <silent> ,f <Plug>(coc-codeaction-selected)<down>
command! -nargs=0 Fix :call CocAction('format')
augroup AutoLsp
  autocmd!
  autocmd BufWritePre cpp,h,hpp,rb,go,vim :call CocAction('format')
  autocmd BufWritePre *.cs :Fix
augroup END


"----------------------------------------------------
" Ag
"----------------------------------------------------
nnoremap ,s :Ag <cword><CR>


"----------------------------------------------------
" Quickfix shortcut
"----------------------------------------------------
nnoremap ,n :cn<CR>


"----------------------------------------------------
" gh line - github line open
"----------------------------------------------------

let g:gh_line_map_default = 0
let g:gh_line_blame_map_default = 1

" ale
let g:ale_linters = {
      \ 'go': ['gobuild', 'golangci-lint'],
      \ }
let g:ale_go_golangci_lint_options = ''


"----------------------------------------------------
" fzf
"----------------------------------------------------
let g:fzf_layout = {
      \ 'up': '~30%' }

nnoremap <silent> <C-p> :GFiles <C-R>=getcwd()<CR><CR>

"----------------------------------------------------
" load .local.vimrc in current directory
"----------------------------------------------------
if filereadable(".local.vimrc")
  source .local.vimrc
endif
if filereadable(".project.vimrc")
  source .project.vimrc
endif


