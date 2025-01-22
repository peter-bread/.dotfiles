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

  # use os-release file when possible
  if [[ -f /etc/os-release ]]; then
    id=$(grep --color=never -ioP '^ID=\K.+' /etc/os-release)

    case $id in
    ubuntu)
      [ -f "$DOTFILES/mise/ubuntu.toml" ] &&
        ln -sf "$DOTFILES/mise/ubuntu.toml" "$XDG_CONFIG_HOME/mise/conf.d/ubuntu.toml"

      # WARN:
      # do I want to be installing software here?
      # Is this just for symlinking files?
      # Is this now becoming more bootstrappy?

      # install dependencies:

      # ruby build
      # sudo apt-get install autoconf patch build-essential rustc libssl-dev \
      #   libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev \
      #   libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev -y

      # lua
      # sudo apt-get install unzip -y
      ;;
    esac
  fi

  # TODO: distinguish between different types of Linux when /etc/os-release doesn't exist

  ;;
esac
