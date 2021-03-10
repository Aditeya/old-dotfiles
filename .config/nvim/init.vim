if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.local/share/nvim/plugged')

"Theme
Plug 'arcticicestudio/nord-vim'
"File Manager
Plug 'scrooloose/nerdtree'
"AutoComplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Misc
Plug 'itchyny/lightline.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

call plug#end()

"Deoplete
let g:deoplete#enable_at_startup = 1

"clipboard
set clipboard+=unnamedplus

"Line number settings
set number relativenumber

"Tab settings
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set autoindent

"Color scheme settings
syntax on
set termguicolors
colorscheme nord

"status line / lightline.vim
set laststatus=2
set t_Co=256
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

"vim-hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

"autocomplete for files
set wildmode=longest,list,full

"Shortcuts

vnoremap <C-c> "+y
"^^^ Ctrl-c copy to clipboard: requires gvim

map <C-p> "+P
"Ctrl-p paste from clipboard

set laststatus=2

