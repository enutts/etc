" Nutts sorta ultimate sorta minimal NVim configuration

call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'vmchale/ion-vim'
call plug#end()

" Colors and some quality of life
syntax on
set title
set number relativenumber
set splitright
set splitbelow
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set wrap breakindent
set encoding=utf-8

" html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2

" journal
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" map time baby
let mapleader=" "
nmap <leader>q :NERDTreeToggle<CR>
nmap <leader><leader> :bprevious<CR>
nmap \ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>n :noh<CR>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
