#!/usr/env/bin bash
set -euo pipefail

DOTFILES_DIR="dotfiles"

echo "enter the max depth from home: "
read MAXDEPTH
cd "$DOTFILES_DIR"

fd . -0 -H -d $MAXDEPTH --base-directory="$HOME"| fzf --read0 --print0 -m --prompt="SELECT FILE/DIRECTORIES TO COPY >> " | xargs -0 -I{} sh -c '
base="$(basename "{}")"
dir_name="${base%.*}"
mkdir -p "$PWD/$dir_name"
OLDPWD="$PWD"
cd "$HOME"
cp --parents -av "{}" "$OLDPWD/$dir_name/"
cd "$OLDPWD"
'
