# .dotfiles

---

<p align="center">
  Managing my dotfiles for MacOS and Linux.
<p/>

---

<!--toc:ignore-->

## Contents

<!--toc:start-->

- [Install](#install)
- [File Structure](#file-structure)
- [Neovim](#neovim)
<!--toc:end-->

## Install

### TL;DR

For [me](https://github.com/peter-bread), on a new system run the following:

```bash
curl -fsSL https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install |
  bash -s -- --prime --modules --pkgs --github --nvim peter.nvim
```

Or:

```bash
wget -qO- https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install |
  bash -s -- --prime --modules --pkgs --github --nvim peter.nvim
```

### Details

Read [install](./install) script help information.

<!-- BEGIN CLI HELP -->

```text
Bootstrap script.

Without any options provided, this script will check if required tools are
installed and will then clone or pull dotfiles repository to ~/.dotfiles.

Options can be provided to enable extra functionality.

Usage:
  ./install [--prime] [--modules] [--pkgs] [--github] [--nvim <repo_name>] [-h | --help]

Options:
  --prime       Ensure system has required packages installed
  --modules     Install modules from MANIFEST.* files
  --pkgs        Install packages from MANIFEST.* files
  --github      Authenticate with GitHub on this device
  --nvim        Clone Neovim config as specified by <repo_name>

                The <repo_name> argument can be one of:
                  - A short name (e.g. "peter.nvim"), resolved as:
                      https://github.com/peter-bread/<repo_name>.git
                  - A full "owner/repo" pair (e.g. "someone/other.nvim"), resolved as:
                      https://github.com/<owner>/<repo_name>.git
                  - A full Git URL (e.g. "https://github.com/user/repo.git"), HTTPS or SSH, used as-is

  -h, --help    Print this help message

Environment Variables:
  These variables mirror the options above. Flags provided on the command line
  take precedence over environment variables. All boolean variables default to 0
  (disabled) unless otherwise noted.

  Option Flags (0 = disable, 1 = enable):
    PRIME       Enable system bootstrap to ensure required packages are installed
    MODULES     Install modules from MANIFEST.* files
    PKGS        Install packages from MANIFEST.* files
    GITHUB      Authenticate with GitHub on this device

  Option Arguments (string; default = empty):
    NVIM        Neovim configuration repository to clone.

  Logging and Output:
    ENABLE_COLOR  Enable colored logging output (default: 1)
    ENABLE_DEBUG  Enable debug logging (default: 0)

  Developer / Advanced:
    DEV_USE_LOCAL   Developer mode: do not attempt to clone/pull dotfiles repo.
                    Useful when testing WIP scripts in a Docker container.
    DEV_USE_TEST    Developer mode: only use MANIFEST.test.
```

<!-- END CLI HELP -->

Ensure `bash` is available.

Download and execute [`install`](./install).

If on a super minimal system, you may need to download on a another machine and
transfer with a USB.

### Default Behaviour

If no options are provided, the script will:

1. Check requirements (will exit if any errors are reported)
1. Clone or update existing `~/.dotfiles` repo

Using `curl`:

```bash
curl -fsSL https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install | bash
```

Using `wget`:

```bash
wget -qO- https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install | bash
```

### Options

Using `curl`:

```bash
curl -fsSL https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install |
  bash -s -- [options]
```

Using `wget`:

```bash
wget -qO- https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install |
  bash -s -- [options]
```

### Install without piping into bash

The following examples will just print help information.

Using `curl`:

```bash
curl -fsSLo install https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install
chmod u+x ./install
./install -h
```

Using `wget`:

```bash
wget -q https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install
chmod u+x ./install
./install -h
```

> [!WARNING]
> If the script detects that the repo is out of date, it will pull changes then
> restart itself. When it restarts, it will always use the version in
> `~/.dotfiles`. If you downloaded the script and it fails after the first run,
> be sure to delete it and only use the one in `~/.dotfiles` in future.
>
> See [this issue](https://github.com/peter-bread/.dotfiles/issues/37).

## File Structure

This repository has an intentionally shallow file structure.

The intent is to make navigating to specific config files quicker, then relying
on `install` scripts to create symlinks and handle "real" directory structure.

The top level consists of a few key things:

<!-- markdownlint-disable MD013 -->

| Item              | Role                                                           |
| ----------------- | -------------------------------------------------------------- |
| `install`         | Entry point; clones repo, options to do more                   |
| `MANIFEST.*`      | Files containing lists of modules and packages to be installed |
| `_*`              | Repo utilities; _NOT_ modules                                  |
| other directories | Modules containing config files and install scripts            |

Each module consists of:

| Item         | Role                                                                |
| ------------ | ------------------------------------------------------------------- |
| `install`    | Script that creates directories and symlinks; can contain any logic |
| `README.md`  | Documentation for the module                                        |
| config files | Self-explanatory                                                    |

<!-- markdownlint-restore -->

### Manifest Files

Manifest files describe what modules and packages should be installed for a
given system. `MANIFEST.common` is for configuration shared across operating
systems and will be read unconditionally. For MacOS and Linux, `MANIFEST.macos`
and `MANIFEST.linux` are read, respectively.

The format of a MANIFEST file is shown below:

```text
# Lines starting with a hash are comments.

# The general structure for an entry in this file is:
# <category>:<name>

# Lines starting with 'mod:' are treated as modules. Whatever follows is the
# name of the module to install. The name should exactly match one of the
# top-level module directories in this repository.
mod:bash

# Lines starting with 'pkg:' are treated as packages. Whatever follows is the
# method and name of the module to install. This section should exactly match
# the file system in the packages directory.
pkg:manual/rustup
pkg:brew/Brewfile
```

### Modules

There are three types of modules:

- Config
- Data
- Actions

| Module Type | Files | Install | Description                                                           |
| ----------- | ----- | ------- | --------------------------------------------------------------------- |
| Config      | ✅    | ✅      | Config files for tools that need to be symlinked to correct locations |
| Data        | ✅    | ❌      | Files that are used by other modules or scripts                       |
| Actions     | ❌    | ✅      | Perform operations, e.g. creating directories                         |

Data and Actions are classed as "Special" modules.

Data modules should _NOT_ be included in `MANIFEST` files.

### Special Modules

Most modules are Config modules, however there are some Special modules.

#### Data

[Packages](./packages/) contains files and scripts used to install software. It
can be used by using the `--pkgs` option with the top-level `install` script.
See [below](#packages) for more information.

[Env](./env/) provides a unified environment layer that centralises
shell-agnostic environment settings. Currently it defines environment
variables, but it may later include aliases and POSIX-compatible helper
functions for cross-shell consistency.

These scripts are sourced by shell startup files in the `bash` and `zsh`
modules, not executed.

#### Actions

[Dirs](./dirs/) is responsible for creating directories to ensure a consistent
work environment.

### Packages

[Packages](./packages/) contains files and scripts used to install software. It
can be used by using the `--pkgs` option with the top-level `install` script.

Packages to install are declared in manifest files using the `pkg:` prefix. The
data that follows is a relative path from [`packages/`](./packages/) pointing
to the file or directory that describes how a package or packages should be
installed (TODO: or updated). In the packages directory, there is a subdirectory
for each installation method.

The following sections go into more detail about the supported installation
methods.

> [!NOTE]
>
> It is likely that more methods will be added in the future, but probably only
> when I actually need them. The categories will probably just be package
> managers for different Linux distros with files containing lists of packages
> to install. For Void this could also contain `xbps-src` package templates
> too. Alternatively, have a `list` category, and each file inside can
> correspond to a package manager.
>
> Potentially some kind of Nix packages but this will likely go in its own
> module directory or even a separate repository.
>
> TODO: Open an issue to track this.

#### Manual

Manual packages are those that need to be installed without a package manager
for some reason. In `packages/manual` there is a directory for each package.
Within these directories, there are up to five scripts, three of which can
currently be used for installation, and a `patches/` directory containing any
patches that may need to be applied by one of the scripts. The scripts are:
`install`, `postinstall` and `completions` (`update` and `uninstall` are not
used during installtion).

If `pkg:manual/foo` is found in a MANIFEST file, the following occurs, where
all scripts are relative to `packages/manual/foo/`:

1. Attempt to find and run `install`,
1. Attempt to find and run `postinstall` if and only if `install` ran
   successfully,
1. Attempt to find and run `completions`.

The `completions` script does not depend on the previous two scripts running,
just that no failures occur. This is because some packages, for example Zig,
can be installed and upgraded via Homebrew, but completions need to be manually
installed.

> [!NOTE]
>
> I may in the future add the ability to only run certain scripts, for example
> maybe on MacOS I only want Zig completions, but on Linux I also want to run
> an actual install script too.
>
> TODO: Open an issue to track this.

> [!NOTE]
>
> In the future I may also create a small CLI interface for interacting with
> manually managed packages. (I could even then use that in the main install
> script when installing from a manifest).
>
> TODO: Open an issue to track this.

#### Brew

Brew packages are those that can be installed with [Homebrew](https://brew.sh/).
This is done using the [Homebrew Bundle](https://docs.brew.sh/Brew-Bundle-and-Brewfile)
feature. This is a snippet from the official docs:

> Homebrew Bundle is run with the `brew bundle` command.
>
> It uses `Brewfile`s to provide a declarative interface for installing/upgrading
> packages with Homebrew and starting services with `brew services`.
>
> Rather than specifying the `brew` commands you wish to run, you can specify the
> state you wish to reach.

If `pkg:brew/Brewfile` is found in a MANIFEST file, the following command is
run:

```bash
brew bundle --file="packages/brew/Brewfile" --verbose
```

## Neovim

My Neovim configuration is in its own repository
[here](https://github.com/peter-bread/peter.nvim).

It can be cloned manually or by using the `--nvim` option with the top-level
`install` script.
