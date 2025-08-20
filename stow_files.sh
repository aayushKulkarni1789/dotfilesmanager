# Stow all copied packages with adopt option
# Only to be used immidiately after copying config files into stow directory

echo "NOTE: This file will help you 'stow' the packages from the dotfiles directory (aka stow directory) to your system. This will just refresh create the symlinks, BUT it will OVERWRITE the dotfiles in dotfiles directory with the ones in the system (The dotfiles in the dotfiles directory will get affected, not your system). Hence this should only be used to refresh the symlinks (for example: immidiately running this after executing dotfiles_add.sh"
read -p="PROCEED? [Yy]" choice
case $choice in
  [yY]* ) echo "Proceeding...";;
  *) exit ;;
esac
DOTFILES_DIR="dotfiles"

cd $DOTFILES_DIR
choices=$(fd . -t d -d 1 | fzf -m)

for choice in $choices; do
	echo "Stowing ${choice%*/}"
	stow -R --adopt -t "$HOME/" ${choice%*/}
done

# xargs -I{} sh -c 'stow --adopt -t "$HOME/" ${{}%%/*}'
