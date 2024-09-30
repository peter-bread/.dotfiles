#!/usr/bin/env bash

function watch() {
  # check if gh is installed
  if ! command -v gh &>/dev/null; then
    echo "Error: gh is not installed" >&2
    echo "Please install gh cli."
    echo ""
    echo "  brew install gh"
    return 1
  fi
  gh run watch --interval 1
}
