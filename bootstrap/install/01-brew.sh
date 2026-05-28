#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$SCRIPT_DIR/../Brewfile"

# Brewfile covers: brew formulas, casks, uv tools, npm globals, cargo crates.
brew bundle --file="$BREWFILE"
