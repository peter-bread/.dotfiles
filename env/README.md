# Env

The `env` module provides a unified environment layer that centralises
shell-agnostic environment settings. Currently it defines environment
variables, but it may later include aliases and POSIX-compatible helper
functions for cross-shell consistency.

These scripts are sourced by shell startup files, not executed.
