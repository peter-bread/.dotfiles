#!/usr/bin/env bash

red="\e[0;31m"
yellow="\e[33m"
bold="\e[1m"
underline="\e[4m"
reset="\e[0m"

function activate() {
  if [[ -z $1 ]]; then
    activate ".venv"
  else
    if [[ $1 == "-h" || $1 == "--help" ]]; then
      echo "usage: actiavte [ -h | --help ] [<venv_name>]"
      echo
      echo -e "\tactivate               attempts to activate .venv"
      echo -e "\tactivate <venv_name>   attempts to activate <venv_name>"
      echo -e "\tactivate -h, --help    prints help"
      return 1
    fi
    if [[ -f ${1}/bin/activate ]]; then
      source "${1}/bin/activate"
    else
      echo -e "${red}Error: ${1}/bin/activate does not exist.${reset}\n"
      echo -e "${bold}${underline}Hints:${reset}"
      echo -e "${yellow}Did you use the right virtual environment name?"
      echo -e "Are you in the right directory to activate the virtual environment?"
      echo -e "Have you made a virtual environment?${reset}"
    fi
  fi
}
