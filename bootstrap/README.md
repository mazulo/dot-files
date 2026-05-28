# Bootstrap — new macOS profile

Automates setup matching current personal profile.

## Pre-flight (manual)
1. Sign in to iCloud, install Xcode CLT (`xcode-select --install`).
2. Install manually from vendor sites:
   - Ghostty
   - OrbStack
   - VSCode (then run "Shell Command: Install 'code' command in PATH" from command palette)
3. Copy secrets from old profile:
   - `~/.ssh/`
   - `~/.config/age/key.txt`
   - `~/.gitconfig` (or set via env before running)

## Run
```bash
git clone <this-repo> ~/dev/config/dot-files
cd ~/dev/config/dot-files
git checkout refactor
bash bootstrap/bootstrap.sh
```

## What it does
- `01-brew.sh` — install Homebrew + `brew bundle` from Brewfile (formulas, cask `codex`, uv tools, npm globals, cargo)
- `02-shell.sh` — oh-my-zsh + antigen + symlinks (`.zshrc`, `.antigenrc`, `.gitconfig`, `.tmux.conf`, `.config/*`)
- `03-runtimes.sh` — pyenv pythons (3.12.13, 3.13.9, 3.13.13), nvm + node 25.8.2, rustup init, bun
- `04-vscode.sh` — restore VSCode extensions from `vscode-extensions.txt`

## Regenerate inventory (on old profile)
```bash
brew bundle dump --file=bootstrap/Brewfile --force
code --list-extensions > bootstrap/vscode-extensions.txt
```

## Notes
- Brewfile excludes Ghostty/OrbStack/VSCode (manual installs).
- Stow not used — plain symlinks in `02-shell.sh`. Switch to stow if preferred.
- `tmuxp`, `gh`, `nvim`, `starship`, `uv`, `htop` configs live in repo `.config/`.
