#!/usr/bin/env bash

function dot_install() {
  # TODO: add coloured logging
  . "$DOTFILES/_install/install-${1}.sh"
}
