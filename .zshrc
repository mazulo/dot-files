# Path to your oh-my-zsh installation.
export ZSH=/home/mazulo/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fox"
# ZSH_THEME="awesomepanda"
# ZSH_THEME="amuse"
# ZSH_THEME="alanpeabody"
# ZSH_THEME="agnoster"
# ZSH_THEME="avit"
# ZSH_THEME="pygmalion"
# ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/mazulo/dev/sources/geckodriver-v0.10.0-linux64/wires"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Firefox path
export PATH="$PATH:/opt/firefox/firefox"

### Alias
alias django-projects="cd ~/dev/web/django_projects"
alias enter-translations="cd ~/dev/docs/translations"
alias update_sublime="~/dev/executables/add-material-to-subl3.py"

### Git aliases
alias gst="git status"
alias gad="git add ."
alias gadall="git add --all"
alias gcm="git commit"
alias gpush="git push origin master"
alias gitch=git_ch

### Django Project Aliases
alias pm=pm
alias pmake="python manage.py makemigrations"
alias pmigre="python manage.py migrate"
alias pcheck="python manage.py check"
alias pshell="python manage.py shell"
alias puser="python manage.py createsuperuser"
alias papp="python manage.py startapp"
alias run_server="./manage.py runserver_plus --cert /tmp/cert"

### Python Aliases
# alias run_anchor_projects="python2 /home/mazulo/dev/web/anchor_loans_projects/sources/run_projects.py"

### Other aliases
alias video="~/Videos/cursos/pluralsight/video.sh"
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"
alias sqlitestudio="/home/mazulo/Downloads/aur-packages/SQLiteStudio/sqlitestudio"
alias estudo="cd ~/Dev/python/isa && workon estudo"

######################################
### npm path
export PATH=~/npm-global/bin:$PATH

### Golang path
export PATH=$PATH:/usr/local/go/bin

### Ruby shit path
export PATH=$PATH:/home/mazulo/.gem/ruby/2.4.0/bin

### Anaconda stuffs
export PATH=$PATH:/home/mazulo/anaconda3/bin

### NVM shit
# source /usr/share/nvm/init-nvm.sh

# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv virtualenv-init -)"
# eval "$(pyenv init -)"

# added by travis gem
# [ -f /home/mazulo/.travis/travis.sh ] && source /home/mazulo/.travis/travis.sh

# Export editor to pacaur works
export EDITOR=nano

# Tilix configs
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

