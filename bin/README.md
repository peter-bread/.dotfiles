# Scripts

These are general purpose utility shell scripts, which should:

1. stand on their own; independent of the environment
1. have a shebang at the top
1. **not** modify current shell, e.g. cwd or env variables
1. **not** have a file extension
1. be executable (use `chmod u+x`)

These will be symlinking into `$HOME/.local/bin`, so ensure that is added to
`PATH`.
