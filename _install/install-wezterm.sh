#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/wezterm"

ln -sf "$DOTFILES/wezterm/wezterm.lua" "$XDG_CONFIG_HOME/wezterm/wezterm.lua"
