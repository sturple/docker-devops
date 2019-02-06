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

set laststatus=2
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autochdir
syntax on
color darcula
set clipboard=unnamed

let mapleader = "\\"
inoremap <C-s>  <c-o>:update<cr>
nma <C-s> <c-o>:update<cr>
" nmap <silent> <leader>ev :e $MYVIMRC <CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" :inoremap <C-v> <ESC>"+pa
:vnoremap <C-c> "*y
:vnoremap <C-d> "*d<Paste>

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

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitDirty()
  let l:dirty = system("git status --porcelain")
  return strlen(l:dirty) >0?' Dirty ':''
endfunction


function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%{GitDirty()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
