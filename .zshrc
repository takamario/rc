# aliases
alias ag='rg'
alias be='bundle exec'
alias cat='bat -p'
alias ctags="`brew --prefix`/bin/ctags"
alias date='gdate'
alias dc='docker compose'
alias diff='colordiff'
alias find='fd'
alias grep='rg'
alias less='less -R'
alias ls='exa'
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

# git
export GIT_EDITOR=nvim
export PROMPT='%n@%m %1~$(__git_ps1 "(%s)") %# '

# gcloud
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"; fi
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"; fi
if [ -f '/Users/takamario/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/takamario/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/takamario/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/takamario/google-cloud-sdk/completion.zsh.inc'; fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH
export PATH=$PATH:/usr/local/bin
