# Enable zsh completion
# ---------------------

# Load homebrew completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

#Load colorls completion
source $(dirname $(gem which colorls))/tab_complete.sh

# Load compinit function
autoload -Uz compinit

# Initialise zsh completion
compinit
