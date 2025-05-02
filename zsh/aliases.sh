#!/usr/bin/env bash

# =============================================================================
# ================= Permanent =================================================
# =============================================================================

# Shell Utility Commands ------------------------------------------------------
alias c='clear'
alias home='cd && clear'
alias h='cd && clear'

alias so='source'

alias cat='bat'

alias ez='exec zsh'

if command -v delta >/dev/null 2>&1; then
  alias g='git'
else
  alias g='git --no-pager'
fi

alias n='nvim'

alias lzg='lazygit'
alias lzd='lazydocker'

# Default Flags for Commands --------------------------------------------------
alias grep='grep --color=auto'
alias tree='tree -I ".git"' # ignore .git directory

alias ls='eza --color=always --icons=always --group-directories-first --git'
alias ll='ls -l'

# Repository/Project Shortcuts ------------------------------------------------
alias peter='cd $HOME/Developer/peter-bread/peter-bread'

# =============================================================================
# ================= Temporary =================================================
# =============================================================================

# Repository/Project Shortcuts
alias diss='cd $DEVELOPER/ak22112/Year3/tb2/project/program-generator'

alias climate='cd $DEVELOPER/peter-bread/climate'
