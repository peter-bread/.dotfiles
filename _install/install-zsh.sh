#!/usr/bin/env bash

mkdir -p "$ZDOTDIR"
mkdir -p "$ZSH_COMPLETIONS"

ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTFILES/zsh/zprofile" "$ZDOTDIR/.zprofile"
