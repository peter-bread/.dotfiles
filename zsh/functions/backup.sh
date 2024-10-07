#!/usr/bin/env bash

backup() {
  mv "$1"{,.bak}
}

restore() {
  mv "$1"{.bak,}
}

bak() {
  if [[ "$1" == "-r" || $1 == "--restore" ]]; then
    mv "$2"{.bak,}
  elif [[ "$1" == "-h" || $1 == "--help" ]]; then
    echo "help info lol"
  else
    mv "$1"{,.bak}
  fi
}
