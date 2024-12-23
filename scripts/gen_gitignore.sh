#!/usr/bin/env bash

ignore=$(git config --global core.excludesfile)

[[ -n $ignore ]] && cat "${ignore/#\~/"$HOME"}" >.gitignore
