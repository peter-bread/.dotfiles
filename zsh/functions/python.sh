#!/usr/bin/env bash

red="\e[0;31m"
default="\e[39m"

function activate() {
  if [[ -z $1 ]]; then
    source .venv/bin/activate
  else
    if [[ -f ${1}/bin/activate ]]; then
      source "${1}/bin/activate"
    else
      echo -e "${red}Error: ${1}/bin/activate does not exist. Did you use the right venv name?${default}"
    fi
  fi
}
