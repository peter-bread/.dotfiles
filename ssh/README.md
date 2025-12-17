# SSH

The main SSH [config](./config) file contains two `Include` directives:

- The first includes all `*.conf` files in `~/.ssh/config.d/`; these should be
  version-controlled.
- The second is for a non-version-controlled, local config file.

[`github.conf`](./github.conf) contains configuration required for my Git
config to work properly. The hosts for non-default GitHub accounts, i.e. `Host
github-*` should be kept in sync with the `url.*.insteadOf` and
`includeIf.hasconfig:*.path` directives in of [gitconfig](../git/gitconfig).

[`ghostty.conf`](./ghostty.conf) contains configuration required to ensure that
remote machines work with Ghostty if they do not have the necessary terminfo
entries.
