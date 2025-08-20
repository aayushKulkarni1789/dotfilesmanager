# Dotfiles manager
A minimal set of scripts made by someone who just wanted to "try" writing bash scripting

> [!IMPORTANT]
> These files are written by someone who has very little idea about bash scripting. Still, it shouldn't break your systems as far as I know.

> [!IMPORTANT]
> Make a directory called `dotfiles`. This is where your dotfiles would be stored.

> [!CAUTION]
> Make sure you run the scripts from the same directories that they exist in.

## Dependancies
- `fd`
- `fzf`
- `stow`

## What each script does?
### `dotfiles_add.sh`
- Asks for maxdepth from the user and shows `fzf` menu with that maxdepth in the `$HOME` directory.
- Select the files or folders to be added to the dotfiles directory.
- The selections will then be moved to dotfiles directory as stow packages and symlinks for them will be created.

### `dotfiles_unstow.sh`
- Opposite of the previous script.
- Provides an `fzf` interface to select stow packages in dotfiles directory.
- The selected packages will then be moved to their original locations and the symlinks would be removed.

### `import_configs.sh`
- Imports the configs present in the dotfiles directory to your system.
> [!CAUTION]
> This will replace/overwrite the configs in your system with the ones present in the dotfiles directory. It is recommended to take a backup before importing configs taken from outside.
