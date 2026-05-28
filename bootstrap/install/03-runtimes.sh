#!/usr/bin/env bash
set -euo pipefail

# pyenv (brew-installed via Brewfile). Install python versions.
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
for v in 3.12.13 3.13.9 3.13.13; do
  pyenv install -s "$v"
done
pyenv global 3.13.9

# nvm
if [[ ! -d "$HOME/.nvm" ]]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
. "$NVM_DIR/nvm.sh"
nvm install 25.8.2
nvm alias default 25.8.2

# rustup (brew-installed). Initialize toolchain.
if ! rustc --version >/dev/null 2>&1; then
  rustup-init -y --no-modify-path --default-toolchain stable
fi

# bun
if ! command -v bun >/dev/null 2>&1; then
  curl -fsSL https://bun.sh/install | bash
fi

# uv (Brewfile pulls uv tools but not uv itself if absent)
if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi
