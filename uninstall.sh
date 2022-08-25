#!/bin/sh
. $(dirname "$0")/colors.sh
echo $BCyan 1/5 Removing symlinks. $Color_Off

rm -v ~/.gitconfig
rm -v ~/.lessfilter
rm -v ~/.zshenv
rm -v ~/.zsh_aliases
rm -v ~/.zshrc
rm -v ~/.zsh_completion
rm -v ~/.p10k.zsh
