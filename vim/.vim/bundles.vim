" Need this here for Vundle
filetype off

" Load Vundle for managing scripts
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle update itself
Plugin 'gmarik/Vundle.vim'

" Color schemes
Plugin 'vim-scripts/Wombat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/seoul256.vim'
Plugin 'yosiat/oceanic-next-vim'

" New features
Plugin 'sessions.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Syntastic'
Plugin 'ragtag.vim'
Plugin 'surround.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
" After installation run:
" cd ~/.vim/bundle/YouCompleteMe && ./install.sh
Plugin 'Valloric/YouCompleteMe'

" Languages
Plugin 'cespare/vim-toml'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'

" Web development
Plugin 'docunext/closetag.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'mxw/vim-jsx'
Plugin 'ap/vim-css-color'
Plugin 'mtscout6/syntastic-local-eslint.vim'

" Powerline
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Distraction-free writing
Plugin 'junegunn/goyo.vim'

call vundle#end()
filetype off
filetype plugin indent on
