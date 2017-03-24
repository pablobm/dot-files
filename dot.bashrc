#!/usr/bin/env sh

D_DIR="$HOME/.bashrc.d"
shopt -s nullglob
for file in "$D_DIR"/*; do
  source "$file"
done
shopt -u nullglob
