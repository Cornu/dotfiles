set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'  " browse/open files
Plugin 'The-NERD-Commenter'   " Easy commenting
Plugin 'buftabs'              " view open buffers on switching
Plugin 'go.vim'               " Go Tools
" Colors
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
" End Vundle

filetype plugin indent on
syntax on
set mouse=a
set background=dark
colorscheme solarized

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
"set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=4                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
"set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=4                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set hidden                                                   " allow hiding unsaved buffers

" Enable CursorLine
"set cursorline

" Default Colors for CursorLine
"highlight  CursorLine ctermbg=Yellow ctermfg=None

" Change Color when entering Insert Mode
"autocmd InsertEnter * highlight  CursorLine ctermbg=Green ctermfg=Red

" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow ctermfg=None

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-n> :NERDTreeToggle<CR>

" buffer movement
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>

" LaTeX (rubber) macro for compiling
nnoremap <C-l> :w<CR>:!rubber --pdf --warn all %<CR>
" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!zathura %:r.pdf &<CR><CR>

" " md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" use goimports instead of gofmt
let g:gofmt_command = "goimports"
