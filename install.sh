#!/usr/bin/env bash

# make sure important environment variables are set ($DOTFILES, $ZDOTDIR, $XDG_*)
source ./zsh/zshenv

# colours for logging
source ./colours.sh

# functions for installing configs
source ./install_functions.sh

# config directory to handle apps that do/don't support XDG spec
# (attempt to use $XDG_CONFIG_HOME, fall back to $HOME/.config)
export CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"

dot_install zsh
