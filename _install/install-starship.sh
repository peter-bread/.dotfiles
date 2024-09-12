#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/starship"

ln -sf "$DOTFILES/starship/starship.toml" "$XDG_CONFIG_HOME/starship/starship.toml"
