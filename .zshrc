# Path to your oh-my-zsh installation.
# export ZSH=/home/mazulo/.oh-my-zsh
# ZSH_THEME="fox"
# ENABLE_CORRECTION="true"
# plugins=(git celery django docker docker-compose heroku node npm yarn pip postgres python redis-cli)
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

# Tilix fix
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

export PATH="/home/mazulo/.gem/ruby/2.7.0/bin:$PATH"

# added by travis gem
[ ! -s /home/mazulo/.travis/travis.sh ] || source /home/mazulo/.travis/travis.sh

# Initializing startship
eval "$(starship init zsh)"

# Docker aliases
alias run=./bin/run
alias update-deps=./bin/update-deps

# Git aliases
alias gad="git add"

# Terminal
TERM=xterm-256color

