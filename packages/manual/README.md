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

Additionally, there can be:

- an `env` file, which can define environment variables and functions to be
  used across all other scripts within the same package.
- a `patches/` directory, which can contain patches/diffs that other scripts
  can apply.

Ideally there should also be a `README` or some other kind of metadata file to
store information about the package.

Packages should be declared in MANIFEST files with `pkg:manual/<name>`. If the
`-p` option is passed to the top-level `install` script, it will:

1. Start a subshell
1. Source `env` if it exists so any shared environment variables and functions
   are available
1. Attempt to run:
   - `install`
   - `postinstall`, if `install` ran successfully
   - `completions`

### Future

- Potentially create a simple CLI for managing these tools (see [this
  issue](https://github.com/peter-bread/.dotfiles/issues/92)).
