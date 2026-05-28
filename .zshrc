export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$HOME/.cargo/bin:/opt/homebrew/opt/rustup/bin:$PATH"
export DISABLE_AUTO_TITLE='true'

# Starship
export STARSHIP_CONFIG=~/.config/starship.toml
# eval "$(starship init zsh)"
eval "$(brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export ZSH_PYENV_VIRTUALENV=false
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME=""

# Load Antigen
source $HOME/antigen.zsh

# Load Antigen configurations
antigen bundle Aloxaf/fzf-tab
antigen init $HOME/.antigenrc

autoload -Uz compinit
compinit

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath+=${ZDOTDIR:-~}/.zsh_functions
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)


# User configuration
export NVM_DIR="$HOME/.nvm"
export NVM_COMPLETION=true
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -s "$NVM_DIR/zsh_completion.d/nvm" ] && \. "$NVM_DIR/zsh_completion.d/nvm"  # This loads nvm zsh_completion
export PATH="./node_modules/.bin:$PATH"

# Updating PATH
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
# . "$HOME/.local/bin/env"

# virtualenvwrapper settings
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
_vew="$(command -v virtualenvwrapper.sh 2>/dev/null)"
[[ -n "$_vew" ]] && source "$_vew"
unset _vew

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
export FZF_COMPLETION_OPTS='--info=inline'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--highlight-line
--info=inline-right
--ansi
--layout=reverse
--color=bg+:#2e3c64
--color=bg:#1f2335
--color=fg:#c0caf5
--color=gutter:#1f2335
--color=header:#ff9e64
--color=hl+:#2ac3de
--color=hl:#2ac3de
--color=info:#545c7e
--color=marker:#ff007c
--color=pointer:#ff007c
--color=prompt:#2ac3de
--color=query:#c0caf5:regular
--color=scrollbar:#29a4bd
--color=separator:#ff9e64
--color=spinner:#ff007c
--height 60%
--layout reverse
--sort
--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -N -C {}) 2> /dev/null | head -500'
--preview-window right:50%:wrap
"

# tmuxp
export TMUXP_CONFIGDIR=./.config/tmuxp/


# afx config
# source <(afx completion zsh)
# source <(afx init)
# export AFX_SHELL=zsh
# export AFX_SHELL=/opt/homebrew/bin/zsh


# ------------ ZSH Configuration ------------
. "$HOME/.bin/disable.sh"
# Keybindings
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^p' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^n' history-search-forward
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# History
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
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
zstyle ':fzf-tab:*' popup-min-width 160
zstyle ':fzf-tab:*' popup-min-height 30
zstyle ':fzf-tab:*' popup-pad 30 0
zstyle ':fzf-tab:complete:cd:*' fzf-flags --preview-window=right:40%

# ------------ uv environment variables ------------
source $HOME/.local/bin/env
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

start_code="$(cat <<'EOF'
import asyncio

import cloudscraper
import httpx
from bs4 import BeautifulSoup

scraper = cloudscraper.create_scraper(interpreter="nodejs")
headers = {
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7",
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36",
}
EOF
)"
# ------------ ALIASES ------------
alias remove_pycache='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf;'
alias files='git diff HEAD --diff-filter=d --name-only -- '\''*.py'\'' | awk '\''{printf "%s ", $1} END {print ""}'\'''
alias gad='git add'
alias ls='ls --color=auto'
alias run="./bin/run"
alias gclone="rsync -avP --exclude-from=../.gitignore mazulo@hostinger2:/home/mazulo/dev/grabber $HOME/dev/config/dot-files/.config/ && cd grabber && head -n 1 assets/txt/commands.txt"
alias reload="exec $SHELL"
alias ipy='ipython --HistoryManager.hist_file=:memory: -i -c "$start_code"'
alias load-grabber="uv pip uninstall grabberlib2 && uv sync"
alias unload-grabber="uv pip uninstall grabberlib2 && uv pip install -U grabberlib2"
# ---------------------------------

export CHECKPOINT_SERVER_MODE=false

load-direnv() {
  local key_file="${HOME}/.config/age/key.txt"
  local enc_file="${HOME}/.config/age/.envrc.age"
  local plain_file="${HOME}/dev/config/dot-files/.config/.envrc"

  if [[ ! -f "$enc_file" ]]; then
    echo "Missing $enc_file"
    return 1
  fi

  if [[ ! -f "$key_file" ]]; then
    echo "Missing age key: $key_file"
    return 1
  fi

  age --decrypt -i "$key_file" -o "$plain_file" "$enc_file" || return 1

  direnv allow "$PWD" || return 1

  eval "$(direnv export zsh)"
}

unload-direnv() {
  local plain_file="${HOME}/dev/open-source/ashenlabs/dot-files/.config/.envrc"

  if [[ -f "$plain_file" ]]; then
    direnv deny "$PWD" >/dev/null 2>&1 || true
    rm -f "$plain_file"
  fi

  eval "$(direnv export zsh)"
}
eval "$(starship init zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
