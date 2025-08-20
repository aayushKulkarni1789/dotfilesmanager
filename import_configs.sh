# Note: This will replace the existing configs in your system with the one in the ./dotfiles/ directory. It is recommended to take a backup first.

DOTFILES_DIR="dotfiles"

echo "NOTE: This will replace the existing configs in your system with the one in the ./$DOTFILES_DIR/ directory. It is recommended to take a backup first."
read -p="PROCEED? [Yy]" choice
case $choice in
  [yY]* ) echo "Proceeding...";;
  *) exit ;;
esac

cd ./$DOTFILES_DIR/
directories_to_choose=$(fd --base-directory="$PWD" -t d -d 1| fzf -m --prompt="SELECT PACKAGES TO INSTALL >> ")

for directory in $directories_to_choose; do
  cp -av "$PWD/$directory." "$HOME/"
done

