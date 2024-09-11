#!/usr/bin/env bash

# TODO: add support for $XDG_CONFIG_HOME etc

# stow target directory. this is where symlinks will be.
target_dir="$HOME"

# dotfiles directory
dotfiles_dir="$HOME/.dotfiles"

# cd into dotfiles directory
cd "$dotfiles_dir" || exit

# iterate through directories in dotfiles directory
find "$dotfiles_dir" -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
  dirname=$(basename "$dir") # get the base name (e.g. $HOME/.dotfiles/nvim => nvim)
  if [ "$dirname" != ".git" ]; then
    echo "cp -Rn $dir/. $target_dir" # this prints the cp command
    # echo "Copied files from $dirname to $target_subdir..."
  fi
done
