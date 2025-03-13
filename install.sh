#!/usr/bin/env bash

OS="$(uname -s)"

# make sure important environment variables are set ($DOTFILES, $ZDOTDIR, $XDG_*)
source ./zsh/zshenv

# colours for logging
source ./_helpers/colours.sh

# functions for installing configs
source ./_helpers/install_functions.sh

mkdir -p "$DEVELOPER"

# all
dot_install zsh
dot_install scripts
dot_install ghostty
dot_install wezterm
dot_install git
dot_install tmux
dot_install starship
dot_install yamlfmt
dot_install mise
dot_install fastfetch
dot_install neomutt

case $OS in
Darwin)
  dot_install skhd
  ;;

Linux)
  # TODO: Linux-specifics
  ;;
esac
