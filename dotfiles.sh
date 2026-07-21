#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMAND="${1:-}"

usage() {
  echo "Usage: $0 [install|uninstall]"
}

managed_files() {
  local src rel project

  # Top-level hidden files mirror into $HOME, e.g. .zshenv -> ~/.zshenv.
  while IFS= read -r -d '' src; do
    rel="${src#$ROOT_DIR/}"
    printf '%s\t%s\n' "$src" "$HOME/$rel"
  done < <(fd --hidden --type f --max-depth 1 --print0 '^\.' "$ROOT_DIR")

  # Top-level directories mirror into XDG config, e.g. zsh/.zshrc -> ~/.config/zsh/.zshrc.
  for project in "$ROOT_DIR"/*/; do
    [[ -d "$project" ]] || continue

    while IFS= read -r -d '' src; do
      rel="${src#$project}"
      printf '%s\t%s\n' "$src" "${XDG_CONFIG_HOME:-$HOME/.config}/$(basename "$project")/$rel"
    done < <(fd --hidden --type f --print0 . "$project")
  done
}

install() {
  local src dest current backup

  while IFS=$'\t' read -r src dest; do
    mkdir -p "$(dirname "$dest")"

    if [[ -e "$dest" || -L "$dest" ]]; then
      current="$(readlink "$dest" 2>/dev/null || true)"

      if [[ "$current" == "$src" ]]; then
        continue
      elif [[ -L "$dest" ]]; then
        rm "$dest"
      else
        backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
        echo "Backing up $dest -> $backup"
        mv "$dest" "$backup"
      fi
    fi

    echo "Linking $dest -> $src"
    ln -s "$src" "$dest"
  done < <(managed_files)
}

uninstall() {
  local src dest current

  while IFS=$'\t' read -r src dest; do
    current="$(readlink "$dest" 2>/dev/null || true)"

    if [[ "$current" == "$src" ]]; then
      echo "Removing $dest"
      rm "$dest"
    fi
  done < <(managed_files)
}

case "$COMMAND" in
  install)
    install
    ;;
  uninstall)
    uninstall
    ;;
  -h|--help|help)
    usage
    ;;
  *)
    usage >&2
    exit 1
    ;;
esac
