#!/usr/bin/env bash
set -euo pipefail

# Disable macOS symbolic hotkeys to free Ctrl-based bindings for terminal/nvim.
# IDs derived from current profile's com.apple.symbolichotkeys.plist.
#
# Spotlight / dictation / help bundle:   15-26
# Mission Control / App Expose:          32, 33   (ctrl + up/down)
# Input source switch:                   60, 61   (ctrl + space, ctrl + opt + space)
# Move space left/right:                 79, 81   (ctrl + left/right)   <-- primary pain
# Switch to Desktop N:                   118-124  (ctrl + 1..7)
# Launchpad / Show Desktop:              164, 176
#
# NOT disabled (left ON intentionally): 80, 82 — shift+ctrl+arrow (move window between spaces).
disable_hotkey() {
  local id="$1"
  defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add "$id" \
    "<dict><key>enabled</key><false/></dict>"
}

DISABLED_IDS=(
  15 16 17 18 19 20 21 22 23 24 25 26
  32 33
  60 61
  79 81
  118 119 120 121 122 123 124
  164 176
)
for id in "${DISABLED_IDS[@]}"; do
  disable_hotkey "$id"
done

# Key repeat — fast (lower = faster). Defaults are 6 / 25.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold for keys in favor of key repeat (needed for vim).
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Finder: show hidden files + path bar + status bar.
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Screenshots to ~/Pictures/Screenshots (create if missing).
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

# Apply: kill affected services so changes take effect.
for app in Finder Dock SystemUIServer cfprefsd; do
  killall "$app" >/dev/null 2>&1 || true
done

# symbolichotkeys requires logout/login (or this nuke) to fully apply.
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u 2>/dev/null || true

echo "macOS defaults applied. Log out + back in for hotkey changes to fully take effect."
