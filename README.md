# dotfiles

Personal dotfiles.

```sh
./bootstrap.sh              # install tools/apps, apply macOS settings, link dotfiles
./dotfiles.sh install       # link dotfiles into $HOME
./dotfiles.sh uninstall     # remove links created by install
```

Install mapping:

```txt
./.*        -> ~/.*
./<tool>/*  -> ~/.config/<tool>/*
```
