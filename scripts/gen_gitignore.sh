#!/usr/bin/env bash

# Generate a new gitignore using global gitignore as a template

ignore=$(git config --global core.excludesfile)

[[ -n $ignore ]] && cat "${ignore/#\~/"$HOME"}" >.gitignore
