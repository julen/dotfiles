#!/usr/bin/env bash

set -euo pipefail

###############################################################################
# macOS setup
#
# Usage:
#   ./macos/setup.sh
###############################################################################

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() {
  printf "\n==> %s\n" "$1"
}

# ---- Xcode Command Line Tools

if ! xcode-select -p >/dev/null 2>&1; then
  info "Installing Xcode Command Line Tools"

  xcode-select --install

  echo
  echo "Finish installation, then rerun this script."
  exit 1
fi

# ---- Homebrew

if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew"

  /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# ---- Packages & apps

info "Installing Brewfile packages"

brew update
brew bundle --file "$ROOT_DIR/Brewfile"

# ---- macOS defaults

if [[ -f "$ROOT_DIR/defaults.sh" ]]; then
  info "Applying macOS settings"

  "$ROOT_DIR/defaults.sh"
fi

info "macOS setup complete"
