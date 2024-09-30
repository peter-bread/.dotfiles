# Define zsh aliases

# =============================================================================
# ================= Permanent =================================================
# =============================================================================

# Shell Utility Commands ------------------------------------------------------
alias c='clear'
alias home='cd && clear'
alias h='cd && clear'

alias cat='bat'

alias ez='exec zsh'

# activate python venv with name ".venv"
alias activate='source .venv/bin/activate'

alias g='git'
alias n='nvim'

# Configuration Shortcuts -----------------------------------------------------
# alias zsh-conf='nvim ~/.zshrc'                       # zshrc config
# alias zshd-conf='nvim ~/.zshrc.d/'                   # zshrc.d config
# alias nvim-conf='nvim ~/.config/nvim'                # nvim config
# alias nvim-conf-custom='nvim ~/.config/nvim.custom/' # custom nvim config

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
alias sep='cd $HOME/Developer/ak22112/Year2/sep/2023-AIAREnhancedTech'
alias gamon='cd $HOME/Developer/peter-bread/gamon'
alias rednoise='cd $HOME/Developer/ak22112/Year3/tb1/CG/CG2024/"Weekly Workbooks"/"01 Introduction and Orientation"/extras/RedNoise'
