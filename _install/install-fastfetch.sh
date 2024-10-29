#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/fastfetch"

ln -sf "$DOTFILES/fastfetch/config.jsonc" "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
