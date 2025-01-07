# Mise

Configuration file(s) for mise.

`all.toml` is the main configuration file that is used on all systems.

This contains tools that:

- need to be version managed (e.g. node)
- are just nicer when installed via mise (e.g. python)

Other files will be for specific operating systems, for example:

- on Debian-based Linux distros, install `go` via `mise` since it is not available on `apt`

## Install

> [!IMPORTANT]
> Check how mise installs certain tools. It can differ across operating systems.
> Sometimes it fetches pre-built binaries, sometimes it builds from source.
> In the latter case, ensure build dependencies are installed.

Run the following:

```bash
mise i
```

---

[Official Website](https://mise.jdx.dev)
