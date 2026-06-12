# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles for macOS. Each top-level directory corresponds to a tool (`zsh/`, `neovim/`, `tmux/`, `git/`, etc.) and contains the config files for that tool. Files are tracked directly in git — no chezmoi templating is applied here, chezmoi is just installed via Homebrew.

**git identity**: `git/gitconfig` is committed but contains no `[user]` block. Identity lives in `~/.gitconfig.local` (not tracked) and is pulled in via `[include]` at the bottom of the shared config.

## Comments

Preserve and add comments in config files. The existing comments explain *why* settings exist — non-obvious constraints, workarounds, links to upstream issues, intent behind a choice. Don't strip them when editing.

## Formatting

Prettier handles formatting across shell scripts, Lua, TOML, and JSON:

```sh
pnpm run format        # write changes
pnpm run lint          # check only (same as format:check)
```

Files excluded from Prettier are listed in `.prettierignore` — notably `zsh/zshrc`, `ghostty/config`, `Brewfile`, and `slate/slate`.

There are no tests.

## Neovim

The Neovim config (`neovim/`) is a [LazyVim](https://lazyvim.github.io) setup. Entry point is `neovim/init.lua` → `neovim/lua/config/lazy.lua`.

- **Plugin spec**: `neovim/lua/config/lazy.lua` — lists all LazyVim extras enabled (Ruby, TypeScript, Vue, Terraform, SQL, Markdown, TOML, ESLint, Prettier, Claude Code, etc.)
- **Custom plugins**: `neovim/lua/plugins/` — overrides and additions on top of LazyVim
- **User config**: `neovim/lua/config/` — keymaps, options, autocmds

`neovim/lazy-lock.json` pins plugin versions (the only file with pending changes at conversation start).

## Shell (zsh)

Load order: `zsh/zshenv` (all shells, shims-only mise activation) → `zsh/zprofile` (login shells, PATH setup) → `zsh/zshrc` (interactive shells, oh-my-zsh + full mise activation).

`zshrc` loads oh-my-zsh with a large plugin list; some plugins are suppressed inside VS Code/Cursor terminals (`$TERM_PROGRAM == "vscode"`) to avoid interactive issues.

## Runtime versions

`mise/config.toml` sets global tool versions (Node 26, latest Ruby/Python/Terraform/Helm). Project-level overrides go in a project's own `.mise.toml`.

## tmux

Prefix is `C-f` (not the default `C-b`). Pane navigation integrates with Neovim via `C-h/j/k/l`. Split: `prefix + v` (vertical) / `prefix + n` (horizontal).
