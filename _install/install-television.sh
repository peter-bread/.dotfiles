#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/television"

ln -sf "$DOTFILES/television/config.toml" "$XDG_CONFIG_HOME/television/config.toml"
ln -sf "$DOTFILES/television/cable_channels.toml" "$XDG_CONFIG_HOME/television/cable_channels.toml"

# ln -sf "$DOTFILES/television" "$XDG_CONFIG_HOME/television"
