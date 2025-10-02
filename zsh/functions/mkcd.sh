#!/usr/bin/env bash

# create new directory and cd into it

function mkcd() {
  builtin mkdir "$@" && builtin cd
}
