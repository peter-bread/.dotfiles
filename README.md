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

| Level | Meaning                                       | Examples                                |
| ----- | --------------------------------------------- | --------------------------------------- |
| 0     | root                                          | n/a                                     |
| 1     | category                                      | `editor`, `shell`, `terminal-emulators` |
| 2     | this will be symlinked into `$HOME` directory | `.config/`, `.zshrc`, `.tmux.conf`      |
| 3...  | these are sub files/folders also symlinked    | `init.lua`, `starship.sh`, `kitty/`     |

```text
0   1   2   3...
./
├── editor/
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           ├── lua/
│           └── ...
├── shell/
│   ├── .config/
│   │   ├── tmux/
│   │   │   └── tmux.conf
│   │   └── starship.toml
│   ├── .zprofile
│   ├── .zshrc
│   └── .zshrc.d/
│       ├── starship.sh
│       └── ...
├── terminal-emulators/
│   └── .config/
│       ├── kitty/
│       │   └── kitty.conf
│       ├── alacritty/
│       │   └── alacritty.toml
│       └── wezterm/
│           └── wezterm.lua
...
```

maps to:

```text
~/
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
    ├── tmux/
    │   └── tmux.conf
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
