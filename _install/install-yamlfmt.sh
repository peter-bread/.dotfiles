#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/yamlfmt"

ln -sf "$DOTFILES/yamlfmt/yamlfmt.yml" "$XDG_CONFIG_HOME/yamlfmt/yamlfmt.yml"
