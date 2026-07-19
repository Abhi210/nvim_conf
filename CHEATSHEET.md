# Neovim Keymap Cheatsheet

`<leader>` = **Space**. Two live helpers while you work:
- Press **`<leader>`** and wait → **which-key** popup shows what each next key does.
- Press **`<leader>?`** (or **`<leader><leader>`**) → **Legendary** command palette, fuzzy-searchable and sorted by what you use most.

---

## Essentials
| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `jk` (insert mode) | Exit to normal mode |
| `<leader>z` | Zen mode (distraction-free) |
| `<C-c>` (normal/visual) | Copy to system clipboard |

## Files, Search & Explorer
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>r` | Focus file explorer |
| `<leader>ff` | Find files (fuzzy) |
| `<leader>fg` | Live grep (search text in project) |
| `<leader>fb` | Find open buffers |
| `<leader>fs` | Git status files |
| `<leader>fc` | Browse git commits |

## Windows & Splits
| Key | Action |
|-----|--------|
| `<leader>o` | New vertical split |
| `<leader>p` | New horizontal split |
| `<C-h>` / `<C-j>` / `<C-l>` | Move to window left / down / right |
| `<C-Left>` / `<C-Right>` | Shrink / grow width |
| `<C-Up>` / `<C-Down>` | Taller / shorter |

## Buffers (open files, top bar)
| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>1` … `<leader>4` | Jump to buffer 1–4 |
| `<leader>bl` / `<leader>bh` | Move buffer right / left |

## Code Intelligence (LSP)
| Key | Action |
|-----|--------|
| `K` | Hover: show docs/type for symbol under cursor |
| `gd` | Go to definition |
| `gD` | Go to type definition |
| `gri` | Go to implementation (built-in) |
| `grr` | List references (built-in) |
| `<leader>rn` (or `grn`) | Rename symbol everywhere |
| `<leader>ca` (or `gra`) | Code action (quick fix / import / etc.) |
| `gL` / `gR` / `gY` | Glance definitions / references / type defs (preview window) |

## Diagnostics (errors from linter/LSP)
| Key | Action |
|-----|--------|
| *(inline)* | Error text shows automatically at end of the flagged line |
| `<leader>d` | Show the full diagnostic message for the current line (float) |
| `]d` / `[d` | Jump to next / previous diagnostic |

## Autocomplete (insert mode)
| Key | Action |
|-----|--------|
| *(just type)* | Suggestion menu opens automatically |
| `<C-n>` / `<C-p>` or `↓` / `↑` | Next / previous suggestion |
| `Enter` | Accept the selected suggestion |
| `<C-space>` | Force-open the menu |
| `<C-e>` | Dismiss the menu |
| `<C-b>` / `<C-f>` | Scroll the docs popup up / down |
| `Tab` / `<S-Tab>` | Jump to next / previous snippet placeholder |

## Debugging (DAP)
| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Start / continue |
| `<leader>dn` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dr` | Toggle debug REPL |
| `<leader>dl` | Run last debug session |
| `<leader>du` | Toggle debug UI panels |

## Formatting
| Key | Action |
|-----|--------|
| `<leader>gf` (normal) | Format whole buffer, once |
| `<leader>gf` (visual) | Format **only the selected lines** (minimal diff) |
| `<leader>uf` | Toggle format-on-save (off by default) |
| `:FormatEnable` / `:FormatDisable` | Turn format-on-save on / off |

## Git (gitsigns)
| Key | Action |
|-----|--------|
| `<leader>]g` / `<leader>[g` | Next / previous change (hunk) |
| `<leader>hp` | Preview hunk |
| `<leader>hs` / `<leader>hr` | Stage / reset hunk |
| `<leader>hS` / `<leader>hR` | Stage / reset whole buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hb` | Blame current line |
| `<leader>hd` | Diff this file |
| `<leader>ht` | Toggle showing deleted lines |

## Motion & Selection
| Key | Action |
|-----|--------|
| `s` + 2 chars | Flash jump anywhere on screen |
| `S` | Flash treesitter (jump to code nodes) |
| `<C-space>` (normal) | Start / expand treesitter selection |
| `<C-backspace>` | Shrink treesitter selection |
| `gc` (operator), `gcc` (line) | Toggle comment |
| `Alt-h/j/k/l` | Move line / selection around |

## Folds
| Key | Action |
|-----|--------|
| `za` | Toggle fold under cursor |
| `zR` / `zM` | Open all / close all folds |

## Todo Comments & Misc
| Key | Action |
|-----|--------|
| `]t` / `[t` | Next / previous TODO comment |
| `<leader>td` | List all TODO/FIX/HACK comments |
| `<leader>t` | Toggle floating terminal |
| `<C-\>` | Toggle terminal |
| `,v` | Select Python venv (for correct completions) |
| `p` / `P`, `gp` / `gP` | Paste (yanky) |
| `<C-n>` / `<C-p>` (after paste) | Cycle through yank history |
