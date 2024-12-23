#!/usr/bin/env bash

mkdir -p "$HOME/.local/bin"

for script in "$DOTFILES"/scripts/*; do
  ln -sf "$script" "$HOME/.local/bin/$(basename "${script%.*}")"
done
