" Need this here for Vundle
set nocompatible
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

" New features
Plugin 'sessions.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Syntastic'
Plugin 'ragtag.vim'
Plugin 'surround.vim'
Plugin 'Raimondi/delimitMate'

" Web development
Plugin 'docunext/closetag.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'

" Distraction-free writing
Plugin 'junegunn/goyo.vim'

call vundle#end()
