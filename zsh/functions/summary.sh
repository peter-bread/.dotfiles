#!/usr/bin/env bash

# Get summary of git repo

function summary() {

  commits="$(git rev-list --count HEAD)"
  structure="$(tree | tail -n 1)"

  echo "No. of commits: $commits"
  echo "File structure: $structure"

}
