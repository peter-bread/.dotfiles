# Two Approaches

## 1. All Git Config

```gitconfig
; Main gitconfig

; Use personal email and sshCommand by default
[include]
  path = ~/.dotfiles/git/gitconfig-personal

; For repos owned by <work-acc>
[includeIf "hasconfig:remote.*.url:git@github.com:<work-acc>/*"]
	path = ~/.dotfiles/git/gitconfig-work

; For repos owned by organizations that <work-acc> is a member of
[includeIf "hasconfig:remote.*.url:git@github.com:<work-org>/*"]
	path = ~/.dotfiles/git/gitconfig-work
```

```gitconfig
; work gitconfig

[user]
  email = "me@work.com"

[core]
  sshCommand = "ssh -i ~/.ssh/github-work"
```

## 2. Git & SSH Config

```sshconfig
# Use this by default
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-personal
  IdentitiesOnly yes

Host github-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-work
  IdentitiesOnly yes
```

```gitconfig
[url "git@github-work:<work-acc>/"]
	insteadOf = git@github.com:<work-acc>/

[url "git@github-work:<work-org>/"]
	insteadOf = git@github.com:<work-org>/
```

## Option 3: Hybrid

| Role                 | Config                                                                         | Scope  |
| -------------------- | ------------------------------------------------------------------------------ | ------ |
| SSH Key selection    | SSH Config + Git config `url.*.insteadOf`                                      | Remote |
| Email + signing keys | Git config `includeIf.hasconfig:remote.*.url:git@github.com:<work-acc>/*.path` | Repo   |

```sshconfig
# Use this by default
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-personal
  IdentitiesOnly yes

Host github-work
  HostName github.com
  User git
  IdentityFile ~/.ssh/github-work
  IdentitiesOnly yes
```

```gitconfig
; main gitconfig

; --------------------------------------------------

; Use personal email and signing key by default
[include]
  path = ~/.dotfiles/git/gitconfig-personal

; --------------------------------------------------

; Load work email and signing key based on remote url

; For repos owned by <work-acc>
[includeIf "hasconfig:remote.*.url:git@github.com:<work-acc>/*"]
	path = ~/.dotfiles/git/gitconfig-work

; For repos owned by organizations that <work-acc> is a member of
[includeIf "hasconfig:remote.*.url:git@github.com:<work-org>/*"]
	path = ~/.dotfiles/git/gitconfig-work

; --------------------------------------------------

; Make sure correct SSH keys are used for authentication.

[url "git@github-work:<work-acc>/"]
	insteadOf = git@github.com:<work-acc>/

[url "git@github-work:<work-org>/"]
	insteadOf = git@github.com:<work-org>/
```

```gitconfig
; work gitconfig

[user]
  email = "me@work.com"
  signingKey = ~/.ssh/github-work.pub

; DO NOT SET `core.sshCommand`!!!
```
