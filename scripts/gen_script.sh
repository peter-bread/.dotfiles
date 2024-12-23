#!/usr/bin/env bash

set -Eeuo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <filename> [-d <description>] <filename2> ... [-d <descriptionN>]"
  exit 1
fi

generate_script() {
  local filename=$1
  local description=${2:-}

  echo "#!/usr/bin/env bash" >"$filename"
  echo "" >>"$filename"

  if [[ -n $description ]]; then
    echo "# $description" >>"$filename"
    echo "" >>"$filename"
  fi

  echo "set -Eeuo pipefail" >>"$filename"
}

FILENAME=""
DESCRIPTION=""

# parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
  -d | --desc | --description)
    if [[ -z $FILENAME ]]; then
      echo "Error: -d flag cannot be used before a filename."
      exit 1
    fi
    if [[ $# -gt 1 ]]; then
      DESCRIPTION="$2"
      shift 2
    else
      echo "Error: -d flag requires a description string."
      exit 1
    fi
    ;;
  *)
    if [[ -n $FILENAME ]]; then
      generate_script "$FILENAME" "$DESCRIPTION"
    fi
    FILENAME="$1"
    DESCRIPTION="" # Reset DESCRIPTION after processing
    shift
    ;;
  esac
done

# generate the last script if not already processed
if [[ -n $FILENAME ]]; then
  generate_script "$FILENAME" "$DESCRIPTION"
fi
