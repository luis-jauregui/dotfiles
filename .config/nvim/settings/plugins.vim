" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

   "Tree
   Plug 'scrooloose/NERDTree'

   "Themes
   Plug 'morhetz/gruvbox'
   Plug 'ryanoasis/vim-devicons'
   Plug 'joshdick/onedark.vim'
   Plug 'ayu-theme/ayu-vim'
   Plug 'dracula/vim', { 'as': 'dracula' }

   "Icons
   Plug 'ryanoasis/vim-devicons'

   "Airline
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'

   "typing
   Plug 'jiangmiao/auto-pairs'
   Plug 'alvan/vim-closetag'
   Plug 'tpope/vim-surround'

   "Autocomplete
   Plug 'neoclide/coc.nvim', {'branch': 'release'}

   "IDE
   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
   Plug 'junegunn/fzf.vim'
   Plug 'sheerun/vim-polyglot'
   Plug 'scrooloose/nerdcommenter'
   Plug 'yggdroot/indentline'
   Plug 'terryma/vim-multiple-cursors'

   "Git
   Plug 'tpope/vim-fugitive'
   Plug 'mhinz/vim-signify'

call plug#end()
