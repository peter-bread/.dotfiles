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
  --pkgs        Install packages
  --github      Authenticate with GitHub on this device
  --nvim        Clone Neovim config as specified by <repo_name>

                The <repo_name> argument can be one of:
                  - A short name (e.g. "peter.nvim"), resolved as:
                      https://github.com/peter-bread/<repo_name>.git
                  - A full "owner/repo" pair (e.g. "someone/other.nvim"), resolved as:
                      https://github.com/<owner>/<repo_name>.git
                  - A full Git URL (e.g. "https://github.com/user/repo.git"), HTTPS or SSH, used as-is

  -h, --help    Print this help message

Environemnt Variables:
  USE_COLORS      Control colored logging.
                  1 = enable; 0 = disable (default: 1)

  ENABLE_DEBUG    Control debug logging.
                  1 = enable; 0 = disable (default: 0)
```

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

| Item              | Role                                                         |
| ----------------- | ------------------------------------------------------------ |
| `install`         | Entry point; clones repo, options to do more                 |
| `MANIFEST.*`      | Files containing lists of modules to be installed on each OS |
| `_*`              | Directories that are not modules                             |
| other directories | Modules containing config files and install scripts          |

Each module consists of:

| Item         | Role                                                                |
| ------------ | ------------------------------------------------------------------- |
| `install`    | Script that creates directories and symlinks; can contain any logic |
| `README.md`  | Documentation for the module                                        |
| config files | Self-explanatory                                                    |

<!-- markdownlint-restore -->

## Neovim

My Neovim configuration is in its own repository
[here](https://github.com/peter-bread/peter.nvim).

It can be cloned manually or by using the `--nvim` option with `install`.
