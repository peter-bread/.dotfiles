# Env

The `env` module provides a unified environment layer that centralises
shell-agnostic environment settings. Currently it only defines environment
variables for POSIX-compatible shells.

In the future, this module may be
[refactored](https://github.com/peter-bread/.dotfiles/issues/65) to contain
simple key-value pairs which can be parsed by any shell and use its own syntax
to set the environment variables.

These scripts are sourced by shell startup files, not executed.
