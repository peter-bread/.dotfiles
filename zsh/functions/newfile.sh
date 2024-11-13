#!/usr/bin/env bash

# create a file and any missing parent directories

function newfile() {

  function _show_help() {
    title="\e[1;4m"
    reset="\e[0m"

    echo "Create files and any missing parent directories."
    echo
    echo "Usage: newfile <filepaths...>"
    echo
    echo -e "${title}Options:${reset}"
    echo -e "  -h, --help   Show help"
    echo
    echo -e "${title}Example:${reset}"
    echo "To create a file with full path, you can use:"
    echo -e "  \$ newfile ~/.config/someapp/config.yml"
    echo
    echo "This is the same as:"
    echo -e "  \$ mkdir -p ~/.config/someapp && touch ~/.config/someapp/config.yml"
  }

  [[ -z $1 ]] && _show_help && return 1

  [[ $1 == "-h" || $1 == "--help" ]] && _show_help && return 0

  for filepath in "$@"; do
    mkdir -p "$(dirname "$filepath")" && touch "$filepath"
  done
}
