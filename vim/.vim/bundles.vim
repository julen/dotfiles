" Need this here for Vundle
set nocompatible
filetype off

" Load Vundle for managing scripts
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Let Vundle update itself
Bundle 'gmarik/Vundle.vim'

" Color schemes
Bundle 'Wombat'

" New features
Bundle 'sessions.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Syntastic'
Bundle 'ragtag.vim'
Bundle 'surround.vim'

call vundle#end()
