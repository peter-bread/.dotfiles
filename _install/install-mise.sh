#!/usr/bin/env bash

mkdir -p "$XDG_CONFIG_HOME/mise"

ln -sf "$DOTFILES/mise/all.toml" "$XDG_CONFIG_HOME/mise/config.toml"

OS="$(uname -s)"

case $OS in
Darwin)
  [ -f "$DOTFILES/mise/mac.toml" ] &&
    ln -sf "$DOTFILES/mise/mac.toml" "$XDG_CONFIG_HOME/mise/conf.d/mac.toml"
  ;;

Linux)
  # TODO: distinguish between different types of Linux
  ;;
esac
