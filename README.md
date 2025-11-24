# .dotfiles

Managing my dotfiles.

<!--toc:ignore-->

## Contents

<!--toc:start-->

- [Setup](#setup)
- [File Structure](#file-structure)
- [Example](#example)
- [Where's Neovim Config???](#wheres-neovim-config)
<!--toc:end-->

## Setup

<!--toc:ignore-->

### Bootstrap

Use bootstrap script on a new machine (if available):

```sh
curl -sL https://raw.githubusercontent.com/peter-bread/bootstrap/main/silicon-mac.sh | bash
```

<!--toc:ignore-->

### Manual

Clone the repo:

```sh
git clone git@github.com:peter-bread/.dotfiles.git ~/.dotfiles
```

Change to directory:

```sh
cd ~/.dotfiles
```

Run the install script:

```sh
make install
```

Restart shell.

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

## Example

Below is a simple example of how the config files might be installed:

<!--toc:ignore-->

### `install.sh`

```sh
# make sure important environment variables are set ($DOTFILES, $ZDOTDIR, $XDG_*)
source ./zsh/zshenv
```

<!--toc:ignore-->

### `install/install-zsh.sh`

```sh
# make directory for zsh config files
mkdir -p "$ZDOTDIR"

# .zshenv MUST be placed in $HOME directory
ln -sf "$DOTFILES/zsh/zshenv" "$HOME/.zshenv"

# .zshrc MUST be placed in $ZDOTDIR directory
ln -sf "$DOTFILES/zsh/zshrc" "$ZDOTDIR/.zshrc"
```

<!--toc:ignore-->

### `install/install-wezterm.sh`

```sh
# make directory for wezterm config
mkdir -p "$XDG_CONFIG_HOME/wezterm"

# place wezterm config file in that directory
ln -sf "$DOTFILES/wezterm/wezterm.lua" "$XDG_CONFIG_HOME/wezterm/wezterm.lua"
```

## Where's Neovim Config???

My neovim configuration is in its own repository [here](https://github.com/peter-bread/peter.nvim).

You can clone it manually or use a bootstrap script.
