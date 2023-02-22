# export ZSH=/home/mazulo/.oh-my-zsh
ZSH_THEME="gozilla"
# ENABLE_CORRECTION="true"
# source $ZSH/oh-my-zsh.sh

# Load Antigen
source $HOME/antigen.zsh

# Load Antigen configurations
antigen init $HOME/.antigenrc

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export PATH="/home/mazulo/.gem/ruby/2.7.0/bin:$PATH"

# added by travis gem
[ ! -s /home/mazulo/.travis/travis.sh ] || source /home/mazulo/.travis/travis.sh

# Initializing startship
# Not using for now
# eval "$(starship init zsh)"

# Docker aliases
alias run=./bin/run

# Git aliases
alias gad="git add"

# Terminal
TERM=xterm-256color

export PATH="$HOME/.poetry/bin:$PATH"

