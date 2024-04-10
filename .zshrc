# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# aliases
alias be='bundle exec'
alias cat='bat -p'
alias ctags="`brew --prefix`/bin/ctags"
alias date='gdate'
alias dc='docker compose'
alias diff='colordiff'
alias find='fd'
alias grep='rg'
alias less='less -R'
alias ls='eza -g --git'
alias ps='procs'
alias sed='gsed'
alias top='htop'
alias vi='nvim'
alias view='nvim -R'
alias vimdiff='nvim -d'

export LANG='en_US.utf-8'
export CLOUDSDK_PYTHON=python3

# rbenv
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# nodenv
eval "$(nodenv init -)"

# goenv
export GOENV_ROOT=$HOME/.goenv
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# git
export GIT_EDITOR=nvim

# gcloud
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"; fi
if [ -f '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"; fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go
export GOPATH=$HOME/go
