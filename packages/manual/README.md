# Manual Packages

Simple scripts to install, update, generate completions for, patch, and
uninstall packages.

> [!WARNING]
>
> This is still in progress.

There are currently five recognised scripts, though only three are used at the
moment:

- install
- postinstall
- completions
- update
- uninstall

These scripts must be executable.

Packages should be declared in MANIFEST files with `pkg:manual/<name>`. If the
`-p` option is passed to the top-level `install` script, it will attempt to run
`install`, `postinstall` and `completions`.

### Future

- Potentially create a simple CLI for managing these tools (see [this
  issue](https://github.com/peter-bread/.dotfiles/issues/92)).
