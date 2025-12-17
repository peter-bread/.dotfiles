# Git

## `gitconfig`

This is the main config file for all Git settings.

Personal GitHub account config is included unconditionally.

Other accounts can then override this:

- Define an alias in SSH config, e.g. `Host github-work`.
- Add `url.*.insteadOf` and `includeIf.hasconfig:*.path` directives to gitconfig
  (main or local, depending on privacy).

## `gitignore`

This is a global ignore file. The purpose of this is to make it very difficult to
accidentally commit files that should **never** be included in version control.

## `gitconfig-*`

These are account specific settings, i.e. email, SSH/GPG signing.

- `peter-bread` is my main account.
- `ak22112` is my secondary (previously university) account.

## `~/.config/git/local`

Additional machine-specific configuration can be put in `~/.config/git/local`.

This file can contain `includeIf` directives, which should look for config
files in `~/.config/git/local.d/`.

See comment in [gitconfig](./gitconfig) example.

---

[Git Config Docs](https://git-scm.com/docs/git-config)
