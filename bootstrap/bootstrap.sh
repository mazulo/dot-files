#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
export REPO_DIR

echo "==> Bootstrap from $REPO_DIR"

# Preflight: manually-installed apps
missing=()
for app in "Ghostty" "OrbStack" "Visual Studio Code"; do
  [[ -d "/Applications/$app.app" ]] || missing+=("$app")
done
if (( ${#missing[@]} > 0 )); then
  echo "ERROR: install these manually first: ${missing[*]}"
  exit 1
fi

# Xcode CLT
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "Re-run after Xcode CLT install completes."
  exit 0
fi

# Homebrew (needed by step 01 but also for shellenv in later steps)
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

for step in "$SCRIPT_DIR"/install/*.sh; do
  echo ""
  echo "==> $(basename "$step")"
  bash "$step"
done

echo ""
echo "==> Done. Restart terminal (or 'exec zsh')."
