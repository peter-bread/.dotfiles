#!/usr/bin/env bash

CONF_DIR="${GAMON3_CONFIG_DIR:-$XDG_CONFIG_HOME/gamon3}"

mkdir -p "$CONF_DIR"

ln -sf "$DOTFILES/gamon3/config.yaml" "$CONF_DIR/config.yaml"
