#!/usr/bin/env bash

# create a file and any missing parent directories

mkfile() {
  for filepath in "$@"; do
    mkdir -p "$(dirname "$filepath")" && touch "$filepath"
  done
}
