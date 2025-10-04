#!/usr/bin/env bash

# Find / delete symlinks from $DOTFILES.
# Assumes certain environment variables are set.

# exit 0

dirs=("$HOME" "$XDG_CONFIG_HOME" "$ZSH_COMPLETIONS" "$HOME"/.local/bin "$HOME/Library/LaunchAgents")
depths=(1 999 1 1 1)

for i in "${!dirs[@]}"; do
  find "${dirs[i]}" -maxdepth "${depths[i]}" -type l -lname "$DOTFILES/*" # -delete
done

# find "$HOME" -maxdepth 999 -type l -lname "$DOTFILES/*" # -delete
