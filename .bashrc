# aliases
alias ls='ls --color -F'
alias grep='grep --color'
alias diff='colordiff'
alias less='less -R'

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && . $HOME/.nvm/nvm.sh

# git
export GIT_EDITOR=vim
PS1='[\u:\W$(__git_ps1 "(%s)")]$ '
