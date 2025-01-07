#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/skhd"
mkdir -p "$HOME/Library/LaunchAgents"

ln -sf "$DOTFILES/skhd/skhdrc" "$XDG_CONFIG_HOME/skhd/skhdrc"
ln -sf "$DOTFILES/skhd/service.plist" "$HOME/Library/LaunchAgents/com.koekeishiya.skhd.plist"
