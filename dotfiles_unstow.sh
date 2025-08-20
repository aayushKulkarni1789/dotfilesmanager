DOTFILES_DIR="dotfiles"

cd $DOTFILES_DIR
choices=$(fd . -H -t d -d 1 | fzf -m)

for choice in $choices; do
  echo "UnStowing ${choice%*/}"
  stow -D -t "$HOME/" ${choice%*/}
  cp -av "$choice." "$HOME/"
  rm -rf $choice
done
