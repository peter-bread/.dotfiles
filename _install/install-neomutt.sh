#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/neomutt"

ln -sf "$DOTFILES/neomutt/neomuttrc" "$XDG_CONFIG_HOME/neomutt/neomuttrc"
