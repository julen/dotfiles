#!/usr/bin/env bash

set -euo pipefail

###############################################################################
# Bootstrap
#
# Usage:
#   ./bootstrap.sh
###############################################################################

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() {
  printf "\n==> %s\n" "$1"
}

# ---- macOS

info "Running macOS setup"

"$ROOT_DIR/macos/setup.sh"

# ---- Dotfiles

info "Linking dotfiles"

"$ROOT_DIR/dotfiles.sh" install

info "Setup complete"
