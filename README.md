# Dotfiles - Powered by Chezmoi

## Installation
To install the dotfiles, execute the provided `install.sh` script.
```bash
./install.sh
```
Then follow the instructions.

## Brew Packages
* Brew packages are installed in the script `run_onchange_darwin-install-packages.sh.tmpl`
* Define list of packages in `.chezmoidata/packages.yaml`
* This script is executed when executing `chezmoi apply` if there is a change in the files.

## ZSH Plugins
* Plugins are installed and loaded in the ~/.zshrc by executing `antidote load`.
* Define list of plugins in `dot_zsh_plugins.txt` file.
