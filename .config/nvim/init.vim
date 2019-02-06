call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'isobit/vim-darcula-colors'
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


" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autochdir
syntax on
color darcula


let mapleader = "\\"
inoremap <C-s>  <c-o>:update<cr>
nma <C-s> <c-o>:update<cr>
nmap <silent> <leader>ev :e $MYVIMRC <CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
