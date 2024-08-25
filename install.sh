#!/bin/bash

set -e

# List of dotfiles to symlink (source destination)
FILES_TO_SYMLINK=(
#   "bashrc:.bashrc"
  "vimrc:.vimrc"
  "vim:.vim"
  "zshrc:.zshrc"
  "gitconfig:.gitconfig"
  "gdbinit:.gdbinit"
)

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

for pair in "${FILES_TO_SYMLINK[@]}"; do
  src_file=$(echo "$pair" | cut -d':' -f1)
  dest_file=$(echo "$pair" | cut -d':' -f2)

  src="$DOTFILES_DIR/$src_file"
  dest="$HOME/$dest_file"

  if [ -e "$dest" ]; then
    echo "Skipping $dest, already exists."
  else
    ln -s "$src" "$dest"
    echo "Symlinked $src to $dest"
  fi
done
