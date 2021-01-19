filetype on
filetype plugin on
filetype indent on
syntax enable

set number relativenumber
set cursorline
set splitright
set splitbelow
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set scrolloff=8
set nu
set laststatus=2
set nowrap
set noerrorbells
set background=dark

set tabstop=3 softtabstop=3
set shiftwidth=3
set expandtab

" Some servers have issues with backup files
set nobackup
set nowritebackup

" always show signcolumns
set signcolumn=yes
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set autoindent
set smartindent

" if hidden is not set, TextEdit might fail
set hidden

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" searching
set hlsearch
set incsearch
set ignorecase
