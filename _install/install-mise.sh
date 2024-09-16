#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/mise"

ln -sf "$DOTFILES/mise/config.toml" "$XDG_CONFIG_HOME/mise/config.toml"
