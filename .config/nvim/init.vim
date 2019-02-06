1 call plug#begin('~/.vim/plugged')
2 Plug 'godlygeek/tabular'
3 Plug 'isobit/vim-darcula-colors'
4 call plug#end()
5
6 set number
7 set ignorecase
8 set smartcase
9 set hlsearch
10 set incsearch
11 set nobackup
12 set nowb
13 set noswapfile
14 set autoindent
15 set smarttab
16
17
18 " Softtabs, 2 spaces
19 set tabstop=2
20 set shiftwidth=2
21 set shiftround
22 set expandtab
23 set autochdir
24 syntax on
25 color darcula
26
27
28 let mapleader = "\\"
29 inoremap <C-s>  <c-o>:update<cr>
30 nma <C-s> <c-o>:update<cr>
31 " nmap <silent> <leader>ev :e $MYVIMRC <CR>
32 nmap <silent> <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
33
34
35 " :inoremap <C-v> <ESC>"+pa
36 :vnoremap <C-c> "+y
37 :vnoremap <C-d> "+d<Paste>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
