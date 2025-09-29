#!/usr/bin/env bash

function dot_link() {
  FILE="$DOTFILES/_link/${1}"

  if [[ -f $FILE ]]; then
    echo -e "${blue}=> Linking ${yellow}${1} ${blue}config..."
    . "$FILE"
  else
    echo -e "${red}=> Error: ${yellow}${1} ${red}config does not exist"
  fi
}
