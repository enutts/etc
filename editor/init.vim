" Nutts 
" Minimal (but growing) NVim Configuration

call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'
Plug 'cespare/vim-toml'
Plug 'keith/swift.vim'
" Plug 'dense-analysis/ale'
call plug#end()

" Colors and some quality of life
syntax on
set title
set number relativenumber
set splitright
set splitbelow
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 smarttab expandtab
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set wrap breakindent
set encoding=utf-8

" trying out folding

" python 
au FileType py 
    \ setlocal autoindent 
    \ setlocal expandtab
"    NOTE TO SELF: folding is annoying if done wrong
"    \ setlocal foldmethod=indent
    \ setlocal foldlevel=99

" html
au FileType html
    \ setlocal shiftwidth=2 
    \ setlocal tabstop=2
    \ setlocal softtabstop=2
    \ setlocal autoindent

" journal
au FileType journal 
    \ setlocal shiftwidth=2
    \ setlocal tabstop=2 
    \ setlocal softtabstop=2 
    \ setlocal autoindent

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
nnoremap <A-l> <C-w>l
nmap <leader>n :noh<CR>
nnoremap <leader>f za

" quality of life keys
nmap <leader>t :terminal<CR>
nmap <leader>d :vsplit term://bash<CR>
