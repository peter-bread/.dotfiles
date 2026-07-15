#!/usr/bin/env bash

set -Eeuo pipefail

readonly PKG_DIR=$DOTFILES/packages/manual

source "$DOTFILES"/_helpers/core

warn "This script ($(realpath "$0")) is unfinished"

# TODO: Proper argument parsing

CMD=$1
PKG=$2

case $CMD in
install) info "Command: $CMD" ;;
*) error "Unsupported command: $CMD" ;;
esac

readonly env="$PKG_DIR/$PKG/env"
# readonly install="$PKG_DIR/$PKG/install"
# readonly postinstall="$PKG_DIR/$PKG/postinstall"
# readonly completions="$PKG_DIR/$PKG/completions"
#
# readonly update="$PKG_DIR/$PKG/update"

# TODO: Support uninstall command
# shellcheck disable=SC2034
# readonly uninstall="$PKG_DIR/$PKG/uninstall"

run_step() {
  local file=$1

  debug "Running $file"
  "$file" || error "Failed to run $file"
  debug "Ran $file"
}

run_step_if_present() {
  local name=$1
  local file="$PKG_DIR/$PKG/$name"

  if ! is_executable_file "$file"; then
    debug "Skipping $file"
    return
  fi

  run_step "$file"
}

source-env() {
  # shellcheck disable=SC1090
  if [[ -f $env ]]; then
    . "$env"
  else
    debug "No environment to load"
  fi
}

pkg::install() {
  (
    source-env

    if run_step_if_present install; then
      run_step_if_present postinstall
    fi

    run_step_if_present completions

    success "Installed $PKG"
  )
}

pkg::update() {
  (
    source_env
    run_step_if_present update
  )
}

pkg::postinstall() {
  (
    source_env
    run_step_if_present postinstall
  )
}

pkg::completions() {
  (
    source_env
    run_step_if_present completions
  )
}

pkg::install browserctl

# did_install=0
#
# run_count=0
# total=3
#
# run_step() {
#   local file=$1
#
#   debug "Running $file"
#   "$file" || error "Failed to run $file"
#   # WARN: If (( expr )) evaluates to 0, ERR trap is triggered.
#   # Using pre-increment means it will always be incremented above 0 before it
#   # is evaluated. If this ever could evaluate to 0, use:
#   #   run_count=$((run_count + 1))
#   # instead.
#   ((++run_count))
#   debug "Ran $file"
# }
#
# pkg::install() {
#   (
#     # shellcheck disable=SC1090
#     [[ -f $env ]] && . "$env"
#
#     if is_executable_file "$install"; then
#       run_step "$install"
#       did_install=1
#     else
#       debug "Skipping $install"
#     fi
#
#     # Postinstall only runs if install runs successfully.
#     if [[ $did_install -eq 1 ]] && is_executable_file "$postinstall"; then
#       run_step "$postinstall"
#     else
#       debug "Skipping $postinstall"
#     fi
#
#     if is_executable_file "$completions"; then
#       run_step "$completions"
#     else
#       debug "Skipping $completions"
#     fi
#
#     if ((run_count == 0)); then
#       warn "Nothing to install: $run_count/$total scripts were run for $PKG package installation"
#     else
#       success "Installed $PKG package (ran $run_count/$total scripts)"
#     fi
#   )
# }
#
# pkg::update() {
#   (
#     # shellcheck disable=SC1090
#     [[ -f $env ]] && . "$env"
#
#     if is_executable_file "$update"; then
#       run_step "$update"
#     else
#       debug "Skipping $update"
#     fi
#   )
# }
