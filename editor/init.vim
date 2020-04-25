" Nutts 
" Minimal NVim Configuration

call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'dag/vim-fish'
Plug 'vmchale/ion-vim'
Plug 'cespare/vim-toml'
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

" fix fish shell stuff
" honestly not sure this applies to nvim
if &shell =~# 'fish$'
    set shell=bash
endif

" html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2

" journal
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" map time baby
let mapleader=" "

" terminal
tnoremap <Esc> <C-\><C-N>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" insert
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l

" buffer control 
nmap <leader><leader> :bprevious<CR>

" nmap \ <leader>q
" nmap <leader>g :Goyo<CR>
" normal mode 
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>lnmap <leader>n :noh<CR>

" quality of life keys
nmap <leader>t :terminal<CR>
nmap <leader>d :vsplit term://bash<CR>
