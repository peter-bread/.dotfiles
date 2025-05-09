#!/usr/bin/env bash

# checks if current directory is in a git repo
function is_git_repo() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

# cd to root of git repo
function cdgit() {
  cd "$(git rev-parse --show-toplevel)"
}
