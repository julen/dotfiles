filetype plugin indent on
set nocompatible

" leader
let mapleader = ","

" load Vundle stuff
source ~/.vim/bundles.vim

" Workaround for YouCompleteMe + Python issues
" https://github.com/Valloric/YouCompleteMe/issues/611
let $PATH = '/usr/local/bin:'.$PATH

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


" JavaScript
"
" vim-javascript
let g:javascript_conceal_function = "ƒ"
"
" vim-jsx
let g:jsx_ext_required = 0


" default editing
set et sw=2 sts=2 ts=2 ai

" numbers for coding
au FileType python,xml,html,css,c,java,javascript,sh set number

" Ignore useless completions
set wildignore+=*/tmp/*,*.swp,*.swo,*.bak,*.pyc,*.class,*.zip

" 80 char-width (+4 soft limit)
set textwidth=80
set colorcolumn=+4

" search
set hlsearch
set ignorecase

" mouse
if !has("gui_macvim")
  set ttymouse=xterm
endif
set mouse=a

" status
set shortmess+=a
set showcmd
set ruler
set laststatus=2
set report=0
set numberwidth=1

" appeareance
if has("gui_running")
  colorscheme OceanicNext

  " Customize some colors for all schemes
  autocmd ColorScheme * highlight ColorColumn guibg=#2d2d2d ctermbg=246
  autocmd ColorScheme * highlight Normal guifg=#cdd3de guibg=#1b2b34 ctermbg=235 ctermfg=188
else
  colorscheme wombat
endif

syntax on

" gui
set guioptions+=LlRrbT
set guioptions-=LlRrbT

" Full screen editing in MacVim
if has("gui_macvim")
  set fullscreen
endif

" Syntastic options
" requires `npm install -g eslint`
let g:syntastic_javascript_checkers = ['eslint']
" requires `pip install flake8`
let g:syntastic_python_checkers = ['flake8']

" CtrlP plugin options
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|assets|(_)build|locale|po)\/|(\.(git|svn|hg))$',
  \ 'file': '\v\.(exe|so|dll|db|bundle.js|bundle.js.map)$',
  \ }

" Goyo, distraction-free writing
nnoremap <Leader><Space> :Goyo<CR>

" FIXME: save profiles in dev.vim/writing.vim and switch accordingly
function! s:goyo_before()
  colorscheme seoul256
endfunction

function! s:goyo_after()
  if has("gui_running")
    colorscheme OceanicNext
  else
    colorscheme wombat
  endif
endfunction

let g:goyo_callbacks = [function('s:goyo_before'), function('s:goyo_after')]

" Powerline
" requires running: pip install --user git+git://github.com/Lokaltog/powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if has("gui_macvim")
   set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h14
endif
