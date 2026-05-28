#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${REPO_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"

# oh-my-zsh (unattended; do not run zsh, do not chsh)
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# antigen
if [[ ! -f "$HOME/antigen.zsh" ]]; then
  curl -fsSL git.io/antigen -o "$HOME/antigen.zsh"
fi

# virtualenvwrapper (referenced in .zshrc)
if ! command -v virtualenvwrapper.sh >/dev/null 2>&1; then
  /usr/bin/python3 -m pip install --user virtualenvwrapper || true
fi

backup_and_link() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    mv "$dst" "$dst.bak.$(date +%s)"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
}

# Home-level dotfiles
backup_and_link "$REPO_DIR/.zshrc"      "$HOME/.zshrc"
backup_and_link "$REPO_DIR/.antigenrc"  "$HOME/.antigenrc"
backup_and_link "$REPO_DIR/.gitconfig"  "$HOME/.gitconfig"
backup_and_link "$REPO_DIR/.tmux.conf"  "$HOME/.tmux.conf"
backup_and_link "$REPO_DIR/.tmux.conf.local" "$HOME/.tmux.conf.local"
backup_and_link "$REPO_DIR/.direnvrc"   "$HOME/.direnvrc"
backup_and_link "$REPO_DIR/.bin"        "$HOME/.bin"

# ~/.config entries — explicit allowlist (skip unused: afx, alacritty, atuin, lvim)
CONFIG_ITEMS=(
  github-copilot
  htop
  nvim
  tmuxp
  uv
  wezterm
  starship.toml
)
for item in "${CONFIG_ITEMS[@]}"; do
  src="$REPO_DIR/config/$item"
  [[ -e "$src" ]] || { echo "skip missing: $src"; continue; }
  backup_and_link "$src" "$HOME/.config/$item"
done

# Ghostty config (file, not dir)
GHOSTTY_DST="$HOME/Library/Application Support/com.mitchellh.ghostty/config"
if [[ -f "$REPO_DIR/com.mitchellh.ghostty/config" ]]; then
  backup_and_link "$REPO_DIR/com.mitchellh.ghostty/config" "$GHOSTTY_DST"
fi
