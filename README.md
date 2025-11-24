# .dotfiles

Managing my dotfiles.

<!--toc:ignore-->

## Contents

<!--toc:start-->

- [Setup](#setup)
- [File Structure](#file-structure)
- [Neovim](#neovim)
<!--toc:end-->

## Setup

Ensure `bash` is available.

Download and execute [`install`](./install).

Using `curl`:

```bash
curl -fsSL https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install | bash
```

Using `wget`:

```bash
wget -qO- https://raw.githubusercontent.com/peter-bread/.dotfiles/refs/heads/main/install | bash
```

If on a super minimal system, you may need to download on a another machine and
transfer with a USB.

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

## Neovim

My neovim configuration is in its own repository [here](https://github.com/peter-bread/peter.nvim).

You can clone it manually or use a bootstrap script.
