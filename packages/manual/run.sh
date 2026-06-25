#!/usr/bin/env bash

readonly PKG_DIR=$DOTFILES/packages/manual

source "$DOTFILES"/_helpers/core

warn "This script ($0) is unfinished and doesn't do anything at the moment."

CMD=$1
PKG=$2

install="$PKG_DIR/$PKG/install"
postinstall="$PKG_DIR/$PKG/postinstall"
completions="$PKG_DIR/$PKG/completions"

# pkg::postinstall() {
#   local pkg=$1
#
#   if is_executable_file "$PKG_DIR/$pkg"/postinstall; then
#     :
#   fi
#
# }
#
# pkg::completions() {
#   :
# }
#
# pkg::install() {
#   if is_executable_file "$PKG_DIR/$pkg"/install; then
#     :
#   fi
# }
#
# CMD=$1
# PKG=$2
#
# case $CMD in
# install)
#   pkg::install "$PKG"
#   pkg::postinstall "$PKG"
#   pkg::completions "$PKG"
#   ;;
# esac
