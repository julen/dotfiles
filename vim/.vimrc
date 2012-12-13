filetype plugin on
filetype indent on

" leader
let mapleader = ","

" load Vundle stuff
source ~/.vim/bundles.vim

" load plugins
set lpl

" Python editing
au FileType python setl et sw=4 sts=4 ts=4
" add completions for builtins to python
au FileType python setl cpt+=k~/.vim/python-globals.txt
" fold docstrings
au FileType python setl fdm=syntax fen

" C editing
au FileType c setl cin

" default editing
set et sw=2 sts=2 ts=2 ai

" numbers for coding
au FileType python,xml,html,css,c,java,javascript,sh set number

" tab for brackets
nnoremap <tab> %
vnoremap <tab> %

" 80 char-width
set textwidth=80
set cc=+1
hi ColorColumn guibg=#2d2d2d ctermbg=246


" search
set hlsearch
set ignorecase

" mouse
set ttymouse=xterm
set mouse-=a

" status
set shortmess+=a
set showcmd
set ruler
set laststatus=2
set report=0
set numberwidth=1

" appeareance
colorscheme wombat
syntax on

" gui
set guioptions+=LlRrbT
set guioptions-=LlRrbT
