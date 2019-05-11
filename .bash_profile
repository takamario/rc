# aliases
alias ls='ls -G -F'
alias grep='grep --color'
alias diff='colordiff'
alias less='less -R'
alias vi='nvim'
alias view='nvim -R'
alias dc='docker-compose'
alias be='bundle exec'
alias cat='bat'
alias date='gdate'
alias top='htop'
alias sed='gsed'

export LANG='en_US.utf-8'

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"
export PYENV_ROOT=/Users/takamario/.pyenv

# nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && . $HOME/.nvm/nvm.sh

# git
export GIT_EDITOR=nvim
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
PS1='[\u@\h:\W$(__git_ps1 "(%s)")]\$ '

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
