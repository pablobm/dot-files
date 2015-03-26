shopt -s nullglob
for file in "$HOME/.bashrc.d"/*; do
   source "$file"
done
shopt -u nullglob
