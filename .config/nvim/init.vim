call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', {'on' : 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
call plug#end()

set number
set ignorecase
set smartcase
set hlsearch
set incsearch
set nobackup
set nowb
set noswapfile
set autoindent
set smarttab
map <silent> <C-n> :NERDTree<CR>
