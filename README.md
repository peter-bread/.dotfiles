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
export CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
```

<!--toc:ignore-->

#### `install/install-wezterm.sh`

```sh
mkdir -p "$CONFIG/wezterm"
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
