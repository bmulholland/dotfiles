# dotfiles

Personal macOS configuration files managed with plain git.

## Setup

Clone the repo and symlink (or copy) the files you need. There is no install script — files map straightforwardly to their destinations:

| File in repo | Target |
|---|---|
| `zsh/zshenv` | `~/.zshenv` |
| `zsh/zprofile` | `~/.zprofile` |
| `zsh/zshrc` | `~/.zshrc` |
| `git/gitconfig` | `~/.gitconfig` |
| `git/gitignore` | `~/.gitignore` |
| `git/gitattributes` | `~/.gitattributes` |
| `tmux/tmux.conf` | `~/.config/tmux/tmux.conf` |
| `neovim/` | `~/.config/nvim/` |
| `mise/config.toml` | `~/.config/mise/config.toml` |
| `ghostty/config` | `~/.config/ghostty/config` |

### Machine-local git identity

`git/gitconfig` is committed and contains all shared settings, but deliberately omits `[user]`. Create `~/.gitconfig.local` on each machine with your identity:

```gitconfig
[user]
  name = Your Name
  email = you@example.com
```

The shared config includes this file automatically via `[include] path = ~/.gitconfig.local` at the bottom.

### Homebrew

```sh
brew bundle
```

### Neovim plugins

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and auto-install on first launch.

## Approach: why plain git

Several dedicated dotfiles tools exist. Here's why this repo uses plain git instead.

### What the tools offer

**[chezmoi](https://www.chezmoi.io/)** (most popular, ~20k stars) adds templating, password-manager integration, and file encryption on top of git. It solves the problem of needing different config values per machine (e.g., different email addresses, work vs. personal API keys, OS-specific paths) without duplicating files. The cost is a new workflow: you edit files through `chezmoi edit`, apply with `chezmoi apply`, and learn its template syntax. It's the right choice when machine-to-machine variation is significant.

**[yadm](https://yadm.io/)** is lighter: essentially git with built-in support for per-machine file alternates (e.g., `.zshrc##os.Darwin`) and optional GPG encryption. No new workflow to learn — it wraps git commands directly. A good middle ground if you want more than bare git without chezmoi's full complexity.

**[GNU Stow](https://www.gnu.org/software/stow/)** creates symlink trees from a source directory. It solves file organization, not secrets or templating. Pairs well with plain git but doesn't add much beyond what careful gitignore discipline achieves.

**Bare git repo** (the `git --work-tree=$HOME --git-dir=$HOME/.dotfiles` trick) avoids a dedicated tool entirely by pointing git's work tree at `$HOME`. The upside: zero dependencies. The downside: easy to accidentally track or commit sensitive files; no help with multi-machine variation.

### Why plain git works here

This repo's machine-specific variation is handled inline:

- **Conditional shell behavior**: `if [[ "$TERM_PROGRAM" == "vscode" ]]` guards in `zshrc` rather than per-machine file variants
- **Secrets**: sourced from `~/.zshrcsecrets` (excluded from git, present only on the relevant machine)
- **Git identity**: split into `~/.gitconfig.local` (see above) so the shared config is fully committed

This covers the main chezmoi use cases without the additional tooling layer. If the number of machines grows or per-machine variation becomes complex enough that inline guards get unwieldy, chezmoi would be the natural next step.
