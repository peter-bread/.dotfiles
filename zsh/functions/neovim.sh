#!/usr/bin/env bash

function neovim() {

  function show_help() {
    title="\e[1;4m"
    reset="\e[0m"

    echo "Manage neovim status."
    echo
    echo "Usage: neovim <command>"
    echo
    echo -e "${title}Commands:${reset}"
    echo -e "  clear      Delete neovim runtime files"
    echo -e "  update     Update all plugins and mason tools"
    echo -e "  restore    Restore config to state of lazy-lock.json"
    echo -e "  refresh    Equivalent of 'neovim clear && neovim restore'"
    echo -e "  reset      Equivalent of 'neovim clear && neovim update'"
    echo -e "  help       Show help"
    echo
    echo -e "${title}Options:${reset}"
    echo -e "  -h, --help   Show help"
  }

  function clear() {
    rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/${NVIM_APPNAME:-nvim}"
    rm -rf "${XDG_STATE_HOME:-$HOME/.local/state}/${NVIM_APPNAME:-nvim}"
    rm -rf "${XDG_CACHE_HOME:-$HOME/.cache}/${NVIM_APPNAME:-nvim}"
  }

  function update() {
    nvim --headless \
      '+Lazy! sync' \
      '+Lazy! load mason-tool-installer.nvim' \
      +qa
  }

  function restore() {
    nvim --headless \
      '+Lazy! restore' \
      '+Lazy! load mason-tool-installer.nvim' \
      '+MasonToolsClean' \
      +qa
  }

  if [[ -z $1 ]]; then
    show_help
    return 1
  fi

  case $1 in

  -h | --help | help)
    show_help
    ;;

  clear)
    clear
    return 0
    ;;

  update)
    update
    ;;

  restore)
    restore
    ;;

  refresh)
    clear
    restore
    ;;

  reset)
    clear
    update
    ;;

  esac
}
