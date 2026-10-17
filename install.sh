#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
files=(zshrc gitconfig vimrc)

for f in "${files[@]}"; do
  target="$HOME/.$f"
  if [[ -e "$target" && ! -L "$target" ]]; then
    mv "$target" "$target.bak"
    echo "backed up $target -> $target.bak"
  fi
  ln -sfn "$DOTFILES_DIR/$f" "$target"
  echo "linked $target -> $DOTFILES_DIR/$f"
done
