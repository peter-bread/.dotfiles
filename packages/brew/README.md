# Brew

Declarative interface for installing packages.

I have split my packages into multiple `Brewfile`s.

| Brewfile          | Description        | MacOS | Linux |
| ----------------- | ------------------ | ----- | ----- |
| `Brewfile`        | Formulae           | ✅    | ✅    |
| `Brewfile.cask`   | Casks              | ✅    | ❌    |
| `Brewfile.mas`    | Mac App Store Apps | ✅    | ❌    |
| `Brewfile.vscode` | VS Code Extensions | ✅    | ✅    |

I primarily intend to use this on MacOS.

On Linux, it's probably better to use the system package manager where possible.

---

[Offical Website](https://docs.brew.sh/Brew-Bundle-and-Brewfile)
[Advanced Brewfiles](https://docs.brew.sh/Brew-Bundle-and-Brewfile#advanced-brewfiles)
