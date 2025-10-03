# Brew

Declarative interface for installing packages.

Packages have been split into multiple `Brewfile`s depending on what type of
package they are:

| Brewfile          | Description        | MacOS | Linux |
| ----------------- | ------------------ | ----- | ----- |
| `Brewfile`        | Formulae           | ✅    | ✅    |
| `Brewfile.cask`   | Casks              | ✅    | ❌    |
| `Brewfile.mas`    | Mac App Store Apps | ✅    | ❌    |
| `Brewfile.vscode` | VS Code Extensions | ✅    | ✅    |

Primarily intended to be used on MacOS.

On Linux, it's probably better to use the system package manager where possible.

---

[Offical Website](https://docs.brew.sh/Brew-Bundle-and-Brewfile)
&centerdot;
[Advanced Brewfiles](https://docs.brew.sh/Brew-Bundle-and-Brewfile#advanced-brewfiles)
