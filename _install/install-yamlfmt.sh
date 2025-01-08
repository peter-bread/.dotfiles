#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/yamlfmt"

ln -sf "$DOTFILES/yamlfmt/yamlfmt.yaml" "$XDG_CONFIG_HOME/yamlfmt/yamlfmt.yaml"
