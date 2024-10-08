#!/usr/bin/env bash

function y() {
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ "$cwd" != "" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd" || exit
  fi
  rm -f -- "$tmp"
}
