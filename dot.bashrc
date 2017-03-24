#!/usr/bin/env bash

D_DIR="$HOME/.bashrc.d"
shopt -s nullglob
for file in "$D_DIR"/*; do
  source "$file"
done
shopt -u nullglob

dotfiles() {
  "dotfiles_$1"
}

VARS_FILE="$D_DIR"/00_vars
dotfiles_prepare() {
  reset_vars_file
  add_brew_prefixes
}

reset_vars_file() {
  echo "#!/usr/bin/env sh" > "$VARS_FILE"
}

add_brew_prefixes() {
  if [ "$(which brew)" ]; then
    echo "export NVM_PREFIX=$(brew --prefix nvm)" >> "$VARS_FILE"
    echo "export BASH_COMPLETION_PREFIX=$(brew --prefix bash-completion)" >> "$VARS_FILE"
  fi
}
