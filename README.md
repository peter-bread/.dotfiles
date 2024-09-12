# .dotfiles

Managing my dotfiles.

<!--toc:ignore-->

## Contents

<!--toc:start-->

- [File Structure](#file-structure)
- [Setup](#setup)
- [TODO](#todo)
<!--toc:end-->

## File Structure

```text
./
└── category
    └── TO BE SYMLINKED
```

<!-- markdownlint-disable MD013 -->

| Level | Meaning                                     | Examples                            |
| ----- | ------------------------------------------- | ----------------------------------- |
| 0     | root                                        | n/a                                 |
| 1     | category                                    | `zsh`, `wezterm`, `tmux`            |
| 2     | this will be symlinked by an install script | `zshrc`, `wezterm.lua`, `tmux.conf` |
| 3...  | these are sub files/folders also symlinked  |                                     |

<!-- markdownlint-restore -->

Actual config files are split into categories. The symlinking is handled by the
scripts in the `install/` directory. These scripts are invoked by the master `install.sh`
script. They can also be invoked manually using the `dotfiles` command.

```text
0   1   2   3...
./
├── zsh/
│   ├── zshrc
│   ├── zprofile
│   ├── zshrc.d/
│   │   ├── xyz.sh
│   │   └── ...
│   └── zshenv
├── tmux/
│   ├── tmux.conf
├── starship/
│   └── starship.toml
├── kitty/
│   └── kitty.conf
├── alacritty/
│   └── alacritty.toml
├── wezterm/
│   └── wezterm.lua
├── install/
│   ├── install-zsh.sh
│   ├── install-tmux.sh
│   ├── install-kitty.sh
│   ├── install-alacritty.sh
│   ├── install-wezterm.sh
│   └── install-starship.sh
└── install.sh
```

<!--toc:ignore-->

### Example

<!--toc:ignore-->

#### `install.sh`

```sh
# make sure important environment variables are set
source ./zsh/zshenv

# config directory to handle apps that do/don't support XDG spec
export CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
```

<!--toc:ignore-->

#### `install/install-zsh.sh`

```sh
# make directory for zsh config files
mkdir -p "$ZDOTDIR"

# .zshenv MUST be placed in $HOME directory
ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"

# .zshrc MUST be placed in $ZDOTDIR directory
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
```

<!--toc:ignore-->

#### `install/install-wezterm.sh`

```sh
# make directory for wezterm config
mkdir -p "$CONFIG/wezterm"

# place wezterm config file in that directory
ln -sf "$DOTFILES/wezterm/wezterm.lua" "$CONFIG/wezterm.lua"
```

## Setup

1. Run `bootstrap.sh`.

<!--toc:ignore-->

## How `bootstrap.sh` works

<!--TODO: finish writing `bootstrap.sh` and explain it here-->

<!--TODO: all planned todos-->

## TODO

- create uninstall scripts
