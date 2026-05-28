# Bootstrap — new macOS profile

End-to-end automation to reproduce this dotfiles setup on a fresh macOS user profile.

---

## TL;DR

```bash
# After manual preflight below:
git clone git@github.com:<you>/dot-files.git ~/dev/config/dot-files
cd ~/dev/config/dot-files
git checkout refactor
bash bootstrap/bootstrap.sh
```

Total time: ~30 min (mostly brew + pyenv compile).

---

## Phase 0 — Before you log into the new profile (on OLD profile)

Regenerate inventory snapshots so they reflect current state, then commit + push.

```bash
cd ~/dev/config/dot-files

# Refresh Brewfile
brew bundle dump --file=bootstrap/Brewfile --force

# Capture VSCode extensions
code --list-extensions > bootstrap/vscode-extensions.txt

# Capture npm globals (manual update — script reads from Brewfile)
npm ls -g --depth=0

# Capture pyenv versions installed
pyenv versions

git add bootstrap/Brewfile bootstrap/vscode-extensions.txt
git commit -m "chore: refresh bootstrap inventory"
git push
```

**Also collect secrets to a USB stick / AirDrop / 1Password** (do NOT commit):
- `~/.ssh/` — SSH keys + `config` + `known_hosts`
- `~/.config/age/key.txt` — age decryption key (needed by `load-direnv` in `.zshrc`)
- `~/.config/gh/hosts.yml` — GitHub CLI auth token (or re-run `gh auth login` later)
- Any `.envrc` files outside the repo

---

## Phase 1 — Manual installs on NEW profile (preflight)

`bootstrap.sh` refuses to run until these exist. Install BEFORE running the script.

| App | Source | Notes |
|---|---|---|
| **Xcode Command Line Tools** | `xcode-select --install` | script triggers if missing, but easier to do first |
| **Ghostty** | https://ghostty.org | terminal |
| **OrbStack** | https://orbstack.dev | Docker/compose runtime |
| **VSCode** | https://code.visualstudio.com | then `Cmd+Shift+P` → "Shell Command: Install 'code' command in PATH" |

Sign into iCloud first if syncing Desktop/Documents.

---

## Phase 2 — Drop secrets in place

From the USB / wherever you stashed them:

```bash
# SSH
mkdir -p ~/.ssh && chmod 700 ~/.ssh
cp /Volumes/USB/ssh/* ~/.ssh/
chmod 600 ~/.ssh/id_* ~/.ssh/config 2>/dev/null

# age key (used by load-direnv to decrypt .envrc.age)
mkdir -p ~/.config/age
cp /Volumes/USB/age/key.txt ~/.config/age/
chmod 600 ~/.config/age/key.txt

# gh auth (alternative: skip and run `gh auth login` after step 1)
mkdir -p ~/.config/gh
cp /Volumes/USB/gh/hosts.yml ~/.config/gh/
```

---

## Phase 3 — Clone + run

```bash
# Need git first — comes with Xcode CLT
git clone git@github.com:<you>/dot-files.git ~/dev/config/dot-files
cd ~/dev/config/dot-files
git checkout refactor
bash bootstrap/bootstrap.sh
```

`bootstrap.sh` runs every `install/*.sh` in order:

| Script | Purpose | Time |
|---|---|---|
| `01-brew.sh`  | Install Homebrew + run `brew bundle` (formulas, `codex` cask, uv tools, npm globals, cargo crates) | ~10 min |
| `02-shell.sh` | Install oh-my-zsh + antigen + virtualenvwrapper; symlink dotfiles & configs | ~1 min |
| `03-runtimes.sh` | pyenv pythons (3.12.13, 3.13.9, 3.13.13), nvm + node 25.8.2, rustup, bun, uv | ~15 min (pyenv compiles from source) |
| `04-vscode.sh` | Restore VSCode extensions from `vscode-extensions.txt` | ~3 min |
| `05-macos.sh` | macOS `defaults write`: disable Ctrl-hotkeys, fast key repeat, Finder tweaks, screenshot dir | <5 sec |

---

## Phase 4 — Post-run manual steps

1. **Restart Terminal** (or `exec zsh`) — antigen needs fresh shell to fetch bundles.
2. **Log out + back in** — `05-macos.sh` symbolic hotkey changes only fully apply after re-login.
3. **`gh auth login`** — if you skipped copying `hosts.yml`.
4. **Sign into apps**: VSCode (Settings Sync if used), Ghostty (no auth), OrbStack.
5. **Install Ghostty fonts** if missing — config may reference Nerd Font; check `~/Library/Application Support/com.mitchellh.ghostty/config` for `font-family`.
6. **VSCode**: open + verify extensions loaded; sign into Settings Sync if used.
7. **First `cd` into a project with `.envrc.age`** → run `load-direnv` (alias defined in `.zshrc`).

---

## What gets symlinked (Phase 02-shell)

Source → destination. Existing files get backed up to `*.bak.<timestamp>` first.

| Repo path | Symlink target |
|---|---|
| `.zshrc` | `~/.zshrc` |
| `.antigenrc` | `~/.antigenrc` |
| `.gitconfig` | `~/.gitconfig` |
| `.tmux.conf` | `~/.tmux.conf` |
| `.tmux.conf.local` | `~/.tmux.conf.local` |
| `.direnvrc` | `~/.direnvrc` |
| `.bin/` | `~/.bin/` |
| `config/github-copilot/` | `~/.config/github-copilot` |
| `config/htop/` | `~/.config/htop` |
| `config/nvim/` | `~/.config/nvim` |
| `config/tmuxp/` | `~/.config/tmuxp` |
| `config/uv/` | `~/.config/uv` |
| `config/wezterm/` | `~/.config/wezterm` |
| `config/starship.toml` | `~/.config/starship.toml` |
| `com.mitchellh.ghostty/config` | `~/Library/Application Support/com.mitchellh.ghostty/config` |

**Skipped** (in repo but unused): `afx`, `alacritty`, `atuin`, `lvim`. Edit `CONFIG_ITEMS` in `02-shell.sh` to add more.

---

## What the macOS script changes (Phase 05)

**Disabled symbolic hotkeys** (frees Ctrl for terminal/nvim word-jump):
- IDs 15-26: Spotlight, dictation, help bundle
- IDs 32, 33: Mission Control / App Expose (Ctrl+↑/↓)
- IDs 60, 61: Input source switch (Ctrl+Space, Ctrl+Opt+Space)
- IDs 79, 81: Move space left/right (Ctrl+←/→) ← primary pain
- IDs 118-124: Switch to Desktop N (Ctrl+1..7)
- IDs 164, 176: Launchpad / Show Desktop
- **Left enabled**: 80, 82 (Shift+Ctrl+arrow = move window between spaces)

**Other defaults**:
- `KeyRepeat=2`, `InitialKeyRepeat=15` (fast)
- `ApplePressAndHoldEnabled=false` (needed for vim repeated keys)
- Finder: show hidden files, path bar, status bar
- Screenshots → `~/Pictures/Screenshots`

**Does NOT touch**: `fn` key behavior, Dock auto-hide, Trackpad gestures, Spotlight indexing. Add manually if wanted.

---

## Updating the inventory later (on this profile)

```bash
brew bundle dump --file=bootstrap/Brewfile --force
code --list-extensions > bootstrap/vscode-extensions.txt
git commit -am "chore: refresh bootstrap inventory"
```

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| `bootstrap.sh` exits "install these manually first" | Install Ghostty/OrbStack/VSCode under `/Applications/` |
| `brew: command not found` after install | `eval "$(/opt/homebrew/bin/brew shellenv)"` then re-run |
| Antigen bundles missing on first shell | Run `exec zsh` once; antigen fetches on first invocation |
| `code: command not found` during 04-vscode.sh | Run "Shell Command: Install 'code' command in PATH" in VSCode, re-run `bash bootstrap/install/04-vscode.sh` |
| Ctrl+← still switches Space after 05-macos.sh | Log out + back in (symbolic hotkeys cached per-session) |
| `pyenv install` fails to compile | `brew install openssl readline sqlite3 xz zlib tcl-tk` then retry |
| `virtualenvwrapper.sh: not found` | Script attempts `pip install --user virtualenvwrapper`; if PATH issues, install via `uv tool install virtualenvwrapper` and adjust `.zshrc` path |
| `gh` shows "not authenticated" | `gh auth login` (you skipped copying `hosts.yml`) |
| `load-direnv` fails "Missing age key" | Copy `~/.config/age/key.txt` from old profile |

---

## What is NOT automated (deliberately)

- macOS System Settings: trackpad, Dock, hot corners, Spotlight, accessibility — too varied across machines, easier in GUI
- App-store apps (Slack, Zoom, browsers, etc.) — install per-need
- `~/dev/` project clones — clone per-project as needed
- Python virtualenvs in `~/.virtualenvs/` — recreate per-project
- macOS keyboard layout, language settings
- `.gitconfig` user.name/user.email — edit if changed
