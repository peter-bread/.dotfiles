#!/usr/bin/env bash

function bak() {
  restore=0
  command="mv"

  while [[ $1 == --* || $1 == -? ]]; do
    case $1 in
    -c | --copy)
      command="cp"
      shift
      ;;
    -r | --restore)
      restore=1
      shift
      ;;
    *)
      echo "Unknown option"
      return 1
      ;;
    esac
  done

  # If not restoring, do not allow the copy option when creating a backup
  if [[ $restore -eq 1 && $command == "cp" ]]; then
    echo "Error: Cannot use --copy when restoring backups."
    return 1
  fi

  for file in "$@"; do
    if [[ $restore -eq 1 ]]; then
      if [[ $file == *.bak ]]; then
        file_bak="${file%.bak}"
      else
        echo "Doesn't end in .bak. Skipping..."
        continue
      fi

      # Check if the target file already exists
      if [[ -e $file_bak ]]; then
        echo "Warning: '$file_bak' already exists."
        answer=$(bash -c 'read -rp "Would you like to overwrite (y/N)? " ans; echo "$ans"')
        if [[ ! "$answer" =~ ^[Yy]$ ]]; then
          echo "Skipping restoration of '$file'."
          continue
        fi
      fi
    else
      file_bak="${file}.bak"
    fi

    if "$command" "$file" "$file_bak"; then
      echo "Processed: $file -> $file_bak"
    else
      echo "Error processing: $file"
    fi
  done

}
