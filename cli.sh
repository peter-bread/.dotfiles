#!/usr/bin/env bash

# make sure DOTFILES_DIR environment variable is set
if [[ -z $DOTFILES_DIR ]]; then
  printf "Make sure \$DOTFILES_DIR is set. Add the following to your .bashrc or .zshrc file and restart your shell:\n\n"
  printf '  export DOTFILES_DIR="/path/to/dotfiles/directory"\n'
  return 1
fi

title="\e[1;4m"
reset="\e[0m"

dotfiles() {

  # display help / usage instructions
  if [[ -z "$1" || "$1" == "-h" || "$1" == "--help" ]]; then
    printf "Manage dotfiles symlinks.\n\n"
    printf "usage: dotfiles [-h | --help] <cmd> [<args>]\n\n"
    echo -e "${title}Commands:${reset}\n"
    printf "  load      create symlinks\n"
    printf "  unload    prune symlinks\n"
    printf "  rename    rename file and update symlinks\n"
    printf "  reload    prune and create symlinks\n"
    printf "  cd        cd to dotfiles directory\n"
    printf "\n"
    echo -e "${title}Options:${reset}\n"
    printf "  -h, --help     print help\n"
    return 1
  fi

  local command="$1"
  shift

  # loading
  if [[ "$command" == "load" ]]; then

    # ensure an arg is passed in
    if [[ -z "$1" ]]; then
      printf "usage: dotfiles load (<category>... | --all)\n"
      return 1
    fi

    if [[ $1 == "-h" || "$1" == "--help" ]]; then
      printf "usage: dotfiles load (<category>... | --all)\n"
      return 0
    fi

    if [[ "$1" == "--all" ]]; then
      (
        cd "$DOTFILES_DIR" || (printf "Failed to enter dotfiles directory\n" && return 1)

        find "$DOTFILES_DIR" -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
          dirname=$(basename "$dir") # get the base name (e.g. $HOME/.dotfiles/nvim => nvim)
          if [ "$dirname" != ".git" ]; then
            printf "stowing %s...\n" "$dirname"
            stow -t "$HOME" -S "$dirname" # stow the directory into the parent of dotfiles dir
            printf "stowed %s successfully\n" "$dirname"
          fi
        done
      )
    else
      (
        cd "$DOTFILES_DIR" || (printf "Failed to enter dotfiles directory\n" && return 1)
        for arg in "$@"; do
          printf "stowing %s\n" "$arg"
          if stow -t "$HOME" -S "$arg"; then
            printf "stowed %s successfully\n" "$arg"
          fi
        done
      )
    fi

    return 0
  fi

  # unloading
  if [[ "$command" == "unload" ]]; then

    # ensure an arg is passed in
    if [[ -z "$1" ]]; then
      printf "usage: dotfiles unload (<category>... | --all)\n"
      return 1
    fi

    if [[ "$1" == "--all" ]]; then
      (
        cd "$DOTFILES_DIR" || (printf "Failed to enter dotfiles directory\n" && return 1)

        find "$DOTFILES_DIR" -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
          dirname=$(basename "$dir") # get the base name (e.g. $HOME/.dotfiles/nvim => nvim)
          if [ "$dirname" != ".git" ]; then
            printf "unstowing %s...\n" "$dirname"
            stow -t "$HOME" -D "$dirname" # unstow the directory into the parent of dotfiles dir
            printf "unstowed %s successfully\n" "$dirname"
          fi
        done
      )
    else
      (
        cd "$DOTFILES_DIR" || (printf "Failed to enter dotfiles directory\n" && return 1)
        for arg in "$@"; do
          printf "unstowing %s\n" "$arg"
          if stow -t "$HOME" -D "$arg"; then
            printf "unstowed %s successfully\n" "$arg"
          fi
        done
      )
    fi

    return 0
  fi

  # reload
  if [[ "$command" == "reload" ]]; then
    if [[ -z "$1" ]]; then
      printf "usage: dotfiles reload (<category>... | --all)\n"
      return 1
    fi

    if [[ "$1" == "--all" ]]; then
      dotfiles unload --all
      dotfiles load --all
    else
      for arg in "$@"; do
        dotfiles load "$arg"
        dotfiles unload "$arg"
      done
    fi

    return 0
  fi

  # rename
  if [[ "$command" == "rename" ]]; then

    if [[ -z "$1" || -z "$2" ]]; then
      printf "usage: dotfiles rename <old-name> <new-name>\n"
      return 1
    fi

    old_name="$1"
    new_name="$2"

    # TODO: only unstow & restow necessary files

    # attempt to unstow dotfiles
    if ! dotfiles unload --all; then
      printf "Failed to unstow. Exiting.\n"
      return 1
    fi

    # attempt to rename file or directory
    if ! mv "$old_name" "$new_name"; then
      printf "Failed to rename %s to %s. Exiting.\n" "$old_name" "$new_name"
      return 1
    fi

    printf "renamed %s to %s successfully.\n" "$old_name" "$new_name"

    # attempt to stow dotfiles
    if ! dotfiles load --all; then
      printf "Failed to stow. Exiting.\n"
      return 1
    fi

    printf "Successfully renamed %s to %s and re-stowed all dotfiles.\n" "$old_name" "$new_name"

    return 0
  fi

  # cd
  if [[ "$command" == "cd" ]]; then
    cd "$DOTFILES_DIR" || return 1
    return 0
  fi

}
