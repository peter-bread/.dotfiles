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
    └── TO BE IN TARGET DIR
```

| Level | Meaning                                       | Examples                            |
| ----- | --------------------------------------------- | ----------------------------------- |
| 0     | root                                          | n/a                                 |
| 1     | category                                      | `nvim`, `zsh`, `tmux`               |
| 2     | this will be symlinked into `$HOME` directory | `.config/`, `.zshrc`, `.tmux.conf`  |
| 3...  | these are sub files/folders also symlinked    | `init.lua`, `starship.sh`, `kitty/` |

```text
0   1   2   3...
./
├── nvim/
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           ├── lua/
│           └── ...
├── starship/
│   └── .config/
│       └── starship.toml
├── zsh/
│   ├── .zprofile
│   ├── .zshrc
│   └── .zshrc.d/
│       ├── starship.sh
│       └── ...
├── tmux/
│   └── .tmux.conf
├── kitty/
│   └── .config/
│       └── kitty/
│           └── kitty.conf
├── alacritty/
│   └── .config/
│       └── alacritty/
│           └── alacritty.toml
├── wezterm/
│   └── .config/
│       └── wezterm/
│           └── wezterm.lua
...
```

maps to:

```text
~/
├── .tmux.conf
├── .zprofile
├── .zshrc
├── .zshrc.d/
│   ├── starship.sh
│   └── ...
└── .config/
    ├── starship.toml
    ├── nvim/
    │   ├── init.lua
    │   ├── lua/
    │   └── ...
    ├── kitty/
    │   └── kitty.conf
    ├── alacritty/
    │   └── alacritty.toml
    └── wezterm/
        └── wezterm.lua
```

## Setup

1. Run `bootstrap.sh`.

<!--toc:ignore-->

## How `bootstrap.sh` works

<!--TODO: finish writing `bootstrap.sh` and explain it here-->

<!--TODO: all planned todos-->

## TODO

- put nvim config into its own submodule
