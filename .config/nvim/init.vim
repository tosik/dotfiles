if exists('g:home_vim_loaded')
  finish
endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.config/nvim/dein'))
  call dein#begin(expand('~/.config/nvim/dein'))

  " Let dein manage dein
  " Required:
  call dein#add(expand('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim'))
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('rking/ag.vim')
  call dein#add('rhysd/vim-clang-format')
  call dein#add('kana/vim-operator-user')
  call dein#add('tosik/vim-clang', {'rev': 'add-clang-complete-reload-func'})
  call dein#add('tosik/ale', {'rev': 'customized'})
  call dein#add('itchyny/lightline.vim')
  call dein#add('vim-scripts/gtags.vim')
  call dein#add('sakhnik/nvim-gdb')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

set expandtab
set tabstop=2
set shiftwidth=2
set noswapfile

set encoding=utf-8
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png,*/obj/*,*.dep,*.o,*/bin/*,*/build/*,*.ttf

" python provider
let g:python_host_prog  = expand('python2')
let g:python3_host_prog = expand('python3')

let g:clang_cpp_options = '-std=c++14 -stdlib=libc++'
let g:clang_format_auto = 1
let g:clang_check_syntax_auto = 0
let g:clang_verbose_pmenu = 1
let g:clang_auto = 0
let g:clang_compilation_database = './build'

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

" statusline
set laststatus=2

" NERDTree
let g:NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1

" CtrlP
let g:ctrlp_max_files = 100000
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|meta|prefab)$',
  \ }

" ALE
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_c_build_dir_names = ['./build/']
let g:ale_c_parse_compile_commands = 1
"let g:ale_cpp_clangd_options = "-compile-commands-dir=" . getcwd() . "/build"
let g:ale_lint_delay = 3000
let g:ale_linters = {
      \   'c' : ['clangd'],
      \   'cpp' : ['clangd']
      \}
nnoremap ,o :ALEDetail<CR>

"----------------------------------------------------
" Insert include guard to the current file
"----------------------------------------------------
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

" highlight
nnoremap <C-e> :nohlsearch<CR>:set cul cuc<cr>:sleep 50m<cr>:set nocul nocuc<cr>/<BS>

" check clang syntax
nnoremap ,s :ClangSyntaxCheck<CR>:w<CR>

" load .vimrc in current directory
if filereadable(".vimrc")
  let g:home_vim_loaded = 1
  source .vimrc
endif

" load .vimrc.user in current directory
if filereadable(".vimrc.user")
  let g:home_vim_loaded = 1
  source .vimrc.user
endif

" Show definetion of function cousor word on quickfix
noremap <C-]> :<C-u>exe("Gtags ".expand('<cword>'))<CR>
" Show reference of cousor word on quickfix
noremap <C-r> :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>
