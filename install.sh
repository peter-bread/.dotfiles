#!/usr/bin/env bash

# make sure important environment variables are set ($DOTFILES, $ZDOTDIR, $XDG_*)
source ./zsh/zshenv

# colours for logging
source ./_helpers/colours.sh

# functions for installing configs
source ./_helpers/install_functions.sh

dot_install zsh
dot_install wezterm
dot_install git
dot_install tmux
dot_install starship
