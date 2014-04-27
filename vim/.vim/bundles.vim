" Need this here for Vundle
set nocompatible
filetype off

" Load Vundle for managing scripts
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Let Vundle update itself
Plugin 'gmarik/Vundle.vim'

" Color schemes
Plugin 'vim-scripts/Wombat'

" New features
Plugin 'sessions.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Syntastic'
Plugin 'ragtag.vim'
Plugin 'surround.vim'

call vundle#end()
