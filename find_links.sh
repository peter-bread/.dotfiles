#!/usr/bin/env bash

# find / delete symlinks from $DOTFILES
# assumes certain environment variables are set

exit 0

dirs=("$HOME" "$XDG_CONFIG_HOME" "$ZSH_COMPLETIONS" "$HOME"/.local/bin)
depths=(1 999 1 1)

for i in "${!dirs[@]}"; do
  find "${dirs[i]}" -maxdepth "${depths[i]}" -type l -lname "$DOTFILES/*" # -delete
done
