
if !exists('g:vscode')
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
  "Misc
  Plug 'itchyny/lightline.vim'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'lervag/vimtex'
  "Languages
  Plug 'kovetskiy/sxhkd-vim'
  call plug#end()

  "status line / lightline.vim
  set laststatus=2
  set t_Co=256
  set noshowmode
  let g:lightline = {
        \ 'colorscheme': 'nord',
        \ }
  
  "vim-hexokinase
  let g:Hexokinase_highlighters = [ 'backgroundfull' ]
  
  "vimtex
  let g:latex_view_general_viewer = "zathura"
  let g:vimtex_view_method = 'zathura'
  let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
  let g:vimtex_compiler_method = 'latexmk'
  let g:vimtex_compiler_latexmk = {
          \ 'executable' : 'latexmk',
          \ 'options' : [
          \   '-pdf',
  		\	'-bibtex-cond',
          \   '-file-line-error',
          \   '-synctex=1',
          \   '-interaction=nonstopmode',
          \ ],
          \}
  let g:vimtex_grammar_vlty = {'lt_command': 'languagetool'}
  set spelllang=en_gb

endif

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
hi Normal guibg=NONE ctermbg=NONE
hi Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"autocomplete for files
set wildmode=longest,list,full

"Shortcuts

vnoremap <C-c> "+y
"^^^ Ctrl-c copy to clipboard: requires gvim

map <C-p> "+P
"Ctrl-p paste from clipboard

"map leader key to space
nnoremap <SPACE> <Nop>
let mapleader=" "
noremap <leader>w :w<cr>
vnoremap <silent> <leader>s :call SortLines()<cr>

set laststatus=2

function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction
