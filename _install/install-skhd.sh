#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/skhd"

ln -sf "$DOTFILES/skhd/skhdrc" "$XDG_CONFIG_HOME/skhd/skhdrc"
