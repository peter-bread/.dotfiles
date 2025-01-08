# Tooling

This is the priority for installing tools:

1. system package manager
2. specialised installers (ghcup, rustup, sdkman)
3. mise for everything else

This will differ across systems.

I like having the latest version of each tool available, which is easy on macOS
because Homebrew always has the latest stuff, but on Ubuntu this is harder since
`apt` is often a bit behind. So in that case there will be a heavier dependence
on `mise`.
