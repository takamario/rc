# aliases
alias ls='ls -vGF'
alias grep='ag'
alias diff='colordiff'
alias less='less -R'
alias vi='nvim'
alias view='nvim -R'
alias vimdiff='nvim -d'
alias dc='docker-compose'
alias be='bundle exec'
alias cat='bat -p'
alias ctags="`brew --prefix`/bin/ctags"
alias date='gdate'
alias top='htop'
alias sed='gsed'

export LANG='en_US.utf-8'
export CLOUDSDK_PYTHON=python3

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"
export PYENV_ROOT=$HOME/.pyenv

# git
export GIT_EDITOR=nvim
plugins=(… zsh-completions)
autoload -U compinit && compinit
setopt prompt_subst
. /usr/local/etc/bash_completion.d/git-prompt.sh
export PROMPT='%n@%m %1~$(__git_ps1 "(%s)") %# '

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
