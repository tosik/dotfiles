set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/nerdtree')

call dein#end()

" Required:
filetype plugin indent on

" Mouse
set mouse=a

" NERDTree
autocmd VimEnter * execute 'NERDTree'
