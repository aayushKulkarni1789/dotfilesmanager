# Use this script to add dotfiles and stow them from your system to the dotfiles directory. You can select files or entire folders
DOTFILES_DIR="dotfiles"

echo "enter the max depth from home: "
read MAXDEPTH
cd "$DOTFILES_DIR"

fd . -0 -H -d $MAXDEPTH --base-directory="$HOME"| fzf --read0 --print0 -m --prompt="SELECT FILE/DIRECTORIES TO COPY >> " | xargs -0 -I{} sh -c '
base="$(basename "{}")"
dir_name="$(echo $base | tr ".", "_")"
mkdir -p "$PWD/$dir_name"
OLDPWD="$PWD"
cd "$HOME"
echo "Stowing $dir_name"
cp --parents -av "{}" "$OLDPWD/$dir_name/"
rm -rf "{}"
cd "$OLDPWD"
stow -R -t "$HOME/" $dir_name
'
