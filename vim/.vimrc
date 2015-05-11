set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'The-NERD-Commenter'   " Easy commenting
Plugin 'buftabs'              " view open buffers on switching
Plugin 'go.vim'               " Go Tools
Plugin 'scrooloose/syntastic' " Syntax checking
Plugin 'kien/ctrlp.vim'       " Fuzzy finder
Plugin 'tpope/vim-fugitive'   " GIT integration
Plugin 'bling/vim-airline'    " statusline
Plugin 'rust-lang/rust.vim'   " Rust support
" Colors
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
" End Vundle

set encoding=utf-8
filetype plugin indent on
syntax on
set mouse=a
set background=dark
colorscheme slate

set autoindent
set autoread                     " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                  " Fix broken backspace in some setups
set backupcopy=yes               " see :help crontab
set clipboard=unnamed            " yank and paste with the system clipboard
set directory-=.                 " don't store swapfiles in the current directory
set hlsearch                     " highlight all matches
set ignorecase                   " case-insensitive search
set smartcase                    " ... unless they contain at least one capital letter
set incsearch                    " search as you type
set laststatus=2                 " always show statusline
set list                         " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                       " show line numbers
set scrolloff=3                  " show context above/below cursorline
set shiftwidth=4                 " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                    " case-sensitive search if any caps
"set softtabstop=2                " insert mode tab and backspace use 2 spaces
"set expandtab                    " expand tabs to spaces
set tabstop=4                    " actual tabs occupy 8 characters
set wildmenu                     " show a navigable menu for tab completion
set wildmode=longest,list,full
set hidden                       " allow hiding unsaved buffers
set clipboard=unnamed            " use the system clipboard
set colorcolumn=80               " hint at 80 characters
set foldmethod=syntax            " fold on syntax

" put git status, column/row number, total lines, and percentage in status
"set statusline=%F%y%m%r%h%w\ %{fugitive#statusline()}%=[%l,%c]\ [%L,%P]
let g:airline_powerline_fonts = 1

" highlight statusline in insert mode
au InsertEnter * hi StatusLine ctermfg=24
au InsertLeave * hi StatusLine ctermfg=12
" highlight 80 char line with light grey
highlight ColorColumn ctermbg=0

" set the <leader> key (default '\')
let mapleader = " "

" Ctrlp maps
let g:ctrlp_map = '<Leader>e'
noremap <leader>, :CtrlPBuffer<CR>

" buffer movement
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>

" clear search highlights
noremap <leader>/ :nohl<CR>

" toggle paste mode
noremap <leader>p :set paste!<CR>

" spell check
map <F5> :setlocal spell! spelllang=en_us<cr>
"imap <F5> :setlocal spell! spelllang=en_us<cr>
map <F6> :setlocal spell! spelllang=de<cr>
"imap <F6> :setlocal spell! spelllang=de<cr>

" run make
nnoremap <leader>m :w<CR>:make<CR>
" View file with default program through rifle
nnoremap <leader>v :silent !viewdown % &<CR>

" .md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" .tikz is latex
autocmd BufRead,BufNewFile *.tikz set filetype=tex
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" toggle fold with plus
nnoremap + za
vnoremap + zf

" use goimports instead of gofmt
let g:gofmt_command = "goimports"
