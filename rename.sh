#!/usr/bin/env bash

dotfiles_dir="$HOME/.dotfiles"

if [[ -z "$1" || -z "$2" ]]; then
  echo "Usage: rename <old-name> <new-name>"
  exit 1
fi

old_name="$1"
new_name="$2"

# attempt to unstow dotfiles
if ! "$dotfiles_dir/unstow.sh"; then
  echo "Failed to unstow. Exiting."
  exit 1
fi

# attempt to rename file or directory
if ! mv "$old_name" "$new_name"; then
  echo "Failed to rename '$old_name' to '$new_name'. Exiting."
  exit 1
fi

# attempt to stow dotfiles
if ! "$dotfiles_dir/stow_load.sh"; then
  echo "Failed to stow. Exiting."
  exit 1
fi

echo "Successfully renamed '$old_name' to '$new_name' and re-stowed all dotfiles."
