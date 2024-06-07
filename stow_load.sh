#!/bin/bash

# TODO: add support for $XDG_CONFIG_HOME etc
# TODO: add logic to attempt to use newer versions of bash

# stow target directory. this is where symlinks will be.
stow_target_dir="$HOME"

# dotfiles directory
dotfiles_dir="$HOME/.dotfiles"

# get directories (categories) inside dotfiles directory
dirs=$(find "$dotfiles_dir" -mindepth 1 -maxdepth 1 -type d)

# cd into dotfiles directory
cd "$dotfiles_dir" || exit

# iterate through directories in dotfiles directory
for dir in "${dirs[@]}"; do
	dirname=$(basename "$dir")       # get the base name (e.g. $HOME/.dotfiles/nvim => nvim)
	stow -t "$stow_target_dir" "$dirname" # stow the directory into the parent of dotfiles dir
done
