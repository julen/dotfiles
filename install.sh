#!/bin/bash

makedirs() {
  find -type d -exec mkdir -p "$HOME/{}" \;
}

linkfiles() {
  find -type f -exec ln -bs "$PWD/{}" "$HOME/{}" \;
}


install_vim() {
  makedirs
  linkfiles

  if [ ! -d ~/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  fi

  ex -u ~/.vim/bundles.vim '+BundleInstall' '+quit'

  python -c'import keyword;print "\n".join(keyword.kwlist+dir(__builtins__))' |
  sort | uniq > ~/.vim/python-globals.txt
}


if [ $# -eq 0 ]; then
  echo "usage: ./install.sh [vim]"
else
  cd $1
  echo "installing $1 configs"
  eval "install_$1"
fi
