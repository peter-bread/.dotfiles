# Set up go and goenv
# -------------------

# goenv:
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# go:
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
