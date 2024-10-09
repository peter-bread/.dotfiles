#!/usr/bin/env bash

function my() {

  function _show_help_my() {
    echo -e "Go to \e[1mmy\e[0m important places."
    echo
    echo -e "\e[1;4mUsage\e[0m: my <place>"
    echo
    echo -e "\e[1;4mPlaces\e[0m:"
    echo "  d, dots, dotfiles     cd to \$DOTFILES"
    echo "  n, nvim, neovim       cd to nvim config"
  }

  if [[ -z $1 ]]; then
    _show_help_my
    return 1
  fi

  case $1 in
  h | -h | help | --help)
    _show_help_my
    ;;
  d | dots | dotfiles)
    cd "$DOTFILES" || return 1
    ;;
  n | nvim | neovim)
    cd "$XDG_CONFIG_HOME/$NVIM_APPNAME" || return 1
    ;;
  *)
    echo -e "\e[31mError: Not a valid option right now :(\e[0m"
    return 1
    ;;
  esac
}
