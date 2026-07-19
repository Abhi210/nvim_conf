# Neovim Configuration

A modern, VSCode-like Neovim setup built on [`lazy.nvim`](https://github.com/folke/lazy.nvim).
Primary focus: **Python** with **C/C++** support. Features LSP/IntelliSense, autocompletion,
debugging, git integration, fuzzy finding, format-on-demand, and a command palette.

> Keymaps: see [`CHEATSHEET.md`](./CHEATSHEET.md), press `<leader>` (Space) for the which-key
> popup, or `<leader>?` for the searchable command palette.

---

## Prerequisites

These are **system tools** the config relies on. They are **not** installed by Neovim —
you must install them yourself before the setup works fully.

### Required

| Tool | Why it's needed |
|------|-----------------|
| **Neovim ≥ 0.11** | The config uses modern APIs (`vim.lsp.config`, `vim.diagnostic.jump`, `winborder`, native treesitter folding). 0.10 or older will error. |
| **git** | Bootstraps `lazy.nvim` and clones all plugins. |
| **A C compiler** (`gcc` or `clang`) + **make** | Compiles Treesitter parsers and the `blink.cmp` fuzzy-matcher on install. |
| **ripgrep** (`rg`) | Powers Telescope live-grep and todo-comment search. |
| **Node.js** + **npm** | Runtime for the `pyright` Python language server. |
| **Python 3** + **pip** | Needed for `debugpy` (debugging) and virtualenv detection. |
| **unzip** + **curl** (or `wget`) | Used by Mason to download language servers and tools. |
| A **Nerd Font** | Provides the icons in the file tree, statusline, tabs, and completion menu. Set your terminal to use one (e.g. JetBrainsMono Nerd Font). |

### Optional / language-specific

| Tool | For |
|------|-----|
| **fd** | Faster file finding in Telescope (falls back to `find` if absent). |
| A working **Python virtualenv** | Point the LSP at it with `,v` (VenvSelect) so completions see your installed packages (numpy, etc.). |

### Auto-installed (you do NOT install these manually)

On first launch, **Mason** installs these into `~/.local/share/nvim/mason` automatically:

- **LSP servers:** `pyright` (Python types), `ruff` (Python lint), `clangd` (C/C++), `lua-language-server`
- **Formatters:** `stylua` (Lua), `clang-format` (C/C++); Python formatting uses `ruff`
- **Debugger:** `debugpy` (Python)

Plugins themselves are also auto-installed by `lazy.nvim` at the exact versions pinned in
`lazy-lock.json`.

---

## Installation

```bash
# 1. Install the prerequisites above. On Debian/Ubuntu, most of them:
sudo apt install neovim git build-essential ripgrep nodejs npm python3 python3-pip unzip curl

# 2. Back up any existing config, then clone this repo into place:
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
git clone https://github.com/Abhi210/nvim_conf.git ~/.config/nvim

# 3. Launch Neovim — plugins and LSP tools install automatically:
nvim
```

Wait for the initial install to finish (watch `:Lazy` and `:Mason`), then **restart Neovim once**.

### Verifying the install

Inside Neovim:

- `:checkhealth` — flags any missing prerequisites (compiler, node, ripgrep, etc.)
- `:Lazy` — plugin status; should show no failures
- `:Mason` — language servers/tools; should all be `✓`
- Open a `.py` file and run `:LspInfo` — `pyright` and `ruff` should be attached

---

## What's inside

Key plugins (see `lua/plugins/` for the full set):

- **Completion / IntelliSense:** `blink.cmp` + `pyright`
- **LSP:** native `vim.lsp` config via `nvim-lspconfig` + `mason.nvim`
- **Debugging:** `nvim-dap` + `nvim-dap-ui` + `debugpy`
- **Fuzzy finder:** `telescope.nvim`
- **File explorer:** `neo-tree.nvim`
- **Statusline / tabs:** `lualine.nvim` + `bufferline.nvim`
- **Git:** `gitsigns.nvim` + `diffview.nvim`
- **Formatting:** `conform.nvim` (format-on-save is off by default; see `CHEATSHEET.md`)
- **Motions:** `flash.nvim`
- **Shortcut discovery:** `which-key.nvim` + `legendary.nvim` (frecency command palette)
- **Theme:** `kanagawa.nvim`

---

## Keeping multiple machines in sync

This config is a git repo, so:

```bash
git pull                      # get the latest config
nvim +':Lazy restore' +qa     # match plugin versions from lazy-lock.json exactly
```

Never copy `~/.local/share/nvim` between machines — that folder (installed plugins, Mason
binaries, undo history) is machine-local and rebuilds itself from this repo on first launch.
