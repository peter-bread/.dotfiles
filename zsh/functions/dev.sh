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
  e)
    cd ~/testing/my-docker-env || exit
    ;;
  *)
    echo "Error: Invalid argument. Use 'a' or 'p'."
    ;;
  esac
}
