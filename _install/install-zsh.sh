#!/usr/bin/env bash

mkdir -p "$ZDOTDIR"
mkdir -p "$ZSH_COMPLETIONS"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTFILES/zsh/zprofile" "$ZDOTDIR/.zprofile"

# link custom zsh completions
for comp in "$DOTFILES"/zsh/completions/*; do
  ln -sf "$comp" "$ZSH_COMPLETIONS/$(basename "$comp")"
done
