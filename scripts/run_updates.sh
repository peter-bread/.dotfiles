#!/usr/bin/env bash

# Fetch updates for things

set -Eeuo pipefail

# TODO: add logging

brew update
brew upgrade mise

tldr --update
