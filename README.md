# .dotfiles


Managing my dotfiles.


## File Structure

```text
./
└── category
    └── TO BE IN TARGET DIR
```

| Level | Meaning                                       | Examples                          |
| ----- | --------------------------------------------- | --------------------------------- |
| 0     | root                                          | n/a                               |
| 1     | category                                      | `nvim`, `zsh`, `tmux`                   |
| 2     | this will be symlinked into `$HOME` directory | `.config`, `.zshrc`, `.tmux.conf`       |
| 3...  | these are sub files/folders also symlinked    | `init.lua`, `starship.sh`, `kitty.conf` |


```text
0   1   2   3...
./
├── nvim/
│   └── .config/
│       ├── init.lua
│       ├── lua/
│       └── ...
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
│       └── kitty.conf
├── alacritty/
│   └── .config/
│      └── alacritty.toml
└── wezterm/
    └── .config/
        └── wezterm.lua
```


## Setup

1. Run `bootstrap.sh`.


## How `bootstrap.sh` works

<!--TODO: finish writing `bootstrap.sh` and explain it here-->


<!--TODO: all planned todos-->
## TODO

- put nvim config into its own submodule
