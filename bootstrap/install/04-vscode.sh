#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXT_FILE="$SCRIPT_DIR/../vscode-extensions.txt"

if ! command -v code >/dev/null 2>&1; then
  echo "WARN: 'code' CLI not on PATH."
  echo "      In VSCode: Cmd+Shift+P -> 'Shell Command: Install code command in PATH', then re-run this script."
  exit 0
fi

if [[ ! -f "$EXT_FILE" ]]; then
  echo "WARN: $EXT_FILE missing. On old profile run:"
  echo "      code --list-extensions > bootstrap/vscode-extensions.txt"
  exit 0
fi

while IFS= read -r ext; do
  [[ -z "$ext" || "$ext" =~ ^# ]] && continue
  code --install-extension "$ext" --force
done < "$EXT_FILE"
