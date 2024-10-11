#!/usr/bin/env bash

function dev() {
  if [[ -z $DEVELOPER ]]; then
    echo "Error: \$DEVELOPER environment variable is not set."
    return 1
  fi
  case $1 in
  "")
    cd "$DEVELOPER" || exit
    ;;
  a)
    cd "$DEVELOPER"/ak22112 || exit
    ;;
  p)
    cd "$DEVELOPER"/peter-bread || exit
    ;;
  *)
    echo "Error: Invalid argument. Use 'a' or 'p'."
    ;;
  esac
}
