# source $ZSH/oh-my-zsh.sh

# Starship
eval "$(starship init zsh)"

eval "$(brew shellenv)"
# fpath="$(brew --prefix)/share/zsh/site-functions $fpath)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit

# Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path --no-rehash)"
eval "$(pyenv virtualenv-init -)"

# Load Antigen
source $HOME/antigen.zsh

# Load Antigen configurations
antigen init $HOME/.antigenrc

# Load .profile
# source $HOME/.profile

# Updating PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Users/mazulo/.fig/bin:/Users/mazulo/.pyenv/shims:/Library/Frameworks/Python.framework/Versions/3.10/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/mazulo/Downloads/
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# virtualenvwrapper settings
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# flake8 hack to work
export PYTHONPATH="${PYTHONPATH}:./"

# have no idea what is this
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/libxslt/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# git aliases
alias gad="git add"
alias gadall="git add ."
alias undo="git reset --soft HEAD^1"
alias unstage="git reset HEAD"
alias wip="git commit -nam 'wip'"
alias lint=./node_modules/.bin/eslint --ext .jsx,.js --config .eslintrc.js

export LOG_LEVEL="INFO"
export PATH="$HOME/.cargo/bin:$PATH"

# . /Users/mazulo/.cartawebrc
# export PATH=$PATH:/usr/local/Cellar/postgresql/12.2_1/bin/
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Utilities
alias remove_pycache='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf;'
alias prettier="npx prettier --loglevel warn --write"
alias api_tests="pytest -s -o addopts=\"--reuse-db --create-db\" --nomigrations"
alias docker_frontend_bundles="docker-compose run --rm --service-ports node yarn dev_bundle"


fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath+=${ZDOTDIR:-~}/.zsh_functions

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias run="./bin/run"

# Set colors
LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:";
export LS_COLORS
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export PATH="/usr/local/bin/nvim:$PATH"
export PATH=/Users/mazulo/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/zsh_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/zsh_completion.d/nvm"  # This loads nvm zsh_completion
export PATH=/opt/homebrew/bin:/Users/mazulo/.local/bin:/usr/local/bin/nvim:/usr/local/opt/coreutils/libexec/gnubin:/opt/homebrew/opt/coreutils/libexec/gnubin:/Users/mazulo/.yarn/bin:/Users/mazulo/.config/yarn/global/node_modules/.bin:/Users/mazulo/.cargo/bin:/usr/local/opt/libxslt/bin:/usr/local/opt/libxml2/bin:/Users/mazulo/Dev/carta/carta-web/bin:/Users/mazulo/.pyenv/shims:/Library/Frameworks/Python.framework/Versions/3.10/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/mazulo/Downloads/
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/Users/mazulo/bin:$PATH"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# Aliases
alias files='g diff HEAD --diff-filter=d --name-only -- '\''*.py'\'' | awk '\''{printf "%s ", $1} END {print ""}'\'''
eval "$(/opt/homebrew/bin/brew shellenv)"

fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
source $ZSH/oh-my-zsh.sh

# Replace l alias to use eza
# unalias l
# alias l="eza"


# Shortcuts
# alias files='git status --short | awk "{printf \"%s \", \$2}" | awk "{\$1=\$1}1"'
# alias files='git status --short | awk "{if(\$2 ~ /\.py\$/ && \$1 != \"D\"){printf \"%s \", \$2}}" | awk "{\$1=\$1}1"'
alias files='git diff HEAD --diff-filter=d --name-only -- '\''*.py'\'' | awk '\''{printf "%s ", $1} END {print ""}'\'''

# Hatch
. ~/.hatch-complete.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# alias files='git diff HEAD --diff-filter=d --name-only -- '\''*.py'\'' | tr "\n" " "'

# Rye
source "$HOME/.rye/env"

# tmuxp
export TMUXP_CONFIGDIR=./.config/tmuxp/

. "$HOME/.cargo/env"

# ------------ fzf config ------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# afx config
source <(afx completion zsh)
source <(afx init)
export AFX_SHELL=zsh
export AFX_SHELL=/opt/homebrew/bin/zsh

# tmuxp
export TMUXP_CONFIGDIR=./.config/tmuxp/

. "$HOME/.cargo/env"
. "$HOME/.bin/disable.sh"
. "$HOME/.bin/set_nvm.sh"
. "$HOME/.bin/set_docker_compose_file.zsh"

# ------------ ZSH Configuration ------------

# Keybindings
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^p' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^n' history-search-forward

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion style
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# tmux specific setup to make full use of it's "popup" feature
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Aliases
alias ls='ls --color=auto'
