#!/usr/bin/env bash

function dot_install() {
  echo -e "${blue}=> Installing ${yellow}${1} ${blue}config..."
  . "$DOTFILES/_install/install-${1}.sh"
}
