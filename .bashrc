# aliases
alias ls='ls --color -F'
alias grep='grep --color'
alias diff='colordiff'
alias less='less -R'

export LANG='en_US.utf-8'

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"

# nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && . $HOME/.nvm/nvm.sh

# git
export GIT_EDITOR=vim
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
PS1='[\u@\h:\W$(__git_ps1 "(%s)")]\$ '
