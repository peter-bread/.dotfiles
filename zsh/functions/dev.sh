#!/usr/bin/env bash

function dev() {
  case $1 in
  "")
    cd ~/Developer || exit
    ;;
  a)
    cd ~/Developer/ak22112 || exit
    ;;
  p)
    cd ~/Developer/peter-bread || exit
    ;;
  *)
    echo "Error: Invalid argument. Use 'a' or 'p'."
    ;;
  esac
}
