# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

This is a personal Neovim configuration ("Neovim for Server"), written in Lua and managed by [lazy.nvim](https://github.com/folke/lazy.nvim). It targets Neovim v0.11.1 and is meant to be cloned to `~/.config/nvim`.

## Commands

All quality tooling is driven through the `Makefile`. Lua is checked with **luacheck** (lint) and formatted with **stylua**.

- `make lint` — run luacheck over the repo (`.luacheckrc` config)
- `make format` — reformat all Lua with stylua (`stylua.toml` config); `make format-check` verifies without writing
- `make ci` — the CI gate: `format-check` + `lint`. Run this before committing.
- `make check` — `ci` plus pre-commit hooks on all files
- `make auto-fix` / `make fix-and-check` — reformat then re-run the format check
- `make dev-setup` — bootstrap tooling (creates `.venv` via `uv`, installs pre-commit, stylua, luacheck)

There is **no test suite** — `make test` is a stub. Do not claim tests pass; there are none to run.

Pre-commit hooks (`.pre-commit-config.yaml`) run `make lint` and `make format` on any staged `*.lua` file, so formatting/lint failures block commits.

## Architecture

Load order starts at `init.lua`, which requires two modules in sequence:

1. `nvims.core` (`lua/nvims/core/init.lua`) → loads `core.options` then `core.keymaps`. These set editor options and global (non-plugin) keymaps, including `<leader>` = Space.
2. `nvims.lazy` (`lua/nvims/lazy.lua`) → bootstraps lazy.nvim, then calls `require("lazy").setup(...)` importing **two** plugin trees: `nvims.plugins` and `nvims.plugins.lsp`. After setup it applies the `catppuccin` colorscheme.

### Plugin spec convention

Each file in `lua/nvims/plugins/` (and `lua/nvims/plugins/lsp/`) returns a lazy.nvim plugin spec table — either a single spec or a list of specs. lazy.nvim's `import` auto-discovers every module in those directories, so **adding a plugin = adding a new file that returns a spec**; there is no central registry listing them.

- `lua/nvims/plugins/init.lua` holds bare dependency specs (plenary, vim-tmux-navigator).
- `lua/nvims/plugins/lsp/` is imported as its own tree: `lspconfig.lua` and `mason.lua`.
- Plugin-specific keymaps live **inside each plugin's `config` function** (e.g. nvim-tree keymaps in `nvim-tree.lua`), not in `core/keymaps.lua`. When changing a plugin's keybindings, edit that plugin's file.

### Conventions to preserve

- **Formatting is enforced**: tabs, indent width 4, column width 120, double quotes, always-parens on calls (`stylua.toml`). New Lua must pass `make format-check`.
- **File explorer is nvim-tree** (README/docs may colloquially say "NERDTree"); netrw is disabled in `nvim-tree.lua`.
- `format_on_save` is intentionally disabled (see commit history) — do not re-enable it without cause.
- The `d` key is remapped to delete into register `d` (`core/keymaps.lua`), intentionally.

## Docs

User-facing documentation lives in `docs/` (e.g. `docs/keymapping.md`). Keep it in sync when changing keymaps or plugin behavior.
