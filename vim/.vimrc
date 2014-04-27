filetype plugin on
filetype indent on

" leader
let mapleader = ","

" load Vundle stuff
source ~/.vim/bundles.vim

" workaround for Vundle + SSL cert issue
let $GIT_SSL_NO_VERIFY = 'true'

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

" 74 char-width
set textwidth=74
set cc=+6

" search
set hlsearch
set ignorecase

" mouse
if !has("gui_macvim")
  set ttymouse=xterm
endif
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

hi ColorColumn guibg=#2d2d2d ctermbg=246

" Full screen editing in MacVim
if has("gui_macvim")
  set fullscreen
endif

" CtrlP plugin options
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'

" Goyo, distraction-free writing
nnoremap <Leader><Space> :Goyo<CR>

" FIXME: save profiles in dev.vim/writing.vim and switch accordingly
function! s:goyo_before()
  colorscheme seoul256
endfunction

function! s:goyo_after()
  colorscheme wombat
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]
