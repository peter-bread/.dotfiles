# Git

## `gitconfig`

This is the main config file for all git settings.

## `gitignore`

This is a global ignore file. The purpose of this is to make it very difficult to
accidentally commit files that should **never** be included in version control.

## `gitconfig-*`

These are account specific settings, i.e. email and SSH command.

`peter-bread` is my main account.
`ak22112` is my secondary (previously university) account and only works in `~/Developer/ak22112`.

## `~/.config/git/local`

Additional machine-specific configuration can be put in `~/.config/git/local`.

This file can contain `includeIf` directives, which should look for config
files in `~/.config/git/local.d/`.

See comment in [./gitconfig] example.

---

[Git Config Docs](https://git-scm.com/docs/git-config)
