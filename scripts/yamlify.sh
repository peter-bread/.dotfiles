#!/usr/bin/env bash

# Script to ensure consistent YAML extensions in a directory

set -Eeuo pipefail

show_help() {
  echo "Ensure consistent YAML extensions"
  echo
  echo "Usage: $0 <yml|yaml>"
  echo
  echo "  - yml: convert all .yaml files to .yml"
  echo "  - yaml: convert all .yml files to .yaml"
  exit 1
}

if [[ $# -ne 1 ]]; then
  show_help
fi

if [[ $1 != "yml" && $1 != "yaml" ]]; then
  show_help
fi

case $1 in
yml)
  fd -H -e yaml -x mv "{}" "{.}.yml"
  ;;
yaml)
  fd -H -e yml -x mv "{}" "{.}.yaml"
  ;;
esac
