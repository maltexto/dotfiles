# Neovim Configuration - Keymaps

This document lists all custom keymaps configured in this Neovim setup.

## Leader Keys
- **Leader Key**: `<Space>` (space bar)
- **Local Leader Key**: `<Space>` (space bar)

## Search and Navigation
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>c` | Normal | Clear search highlights |
| `n` | Normal | Next search result (centered) |
| `N` | Normal | Previous search result (centered) |
| `<C-d>` | Normal | Half page down (centered) |
| `<C-u>` | Normal | Half page up (centered) |

## Editing
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>d` | Normal/Visual | Delete without yanking |
| `J` | Normal | Join lines and keep cursor position |

## Buffer Navigation
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>bn` | Normal | Next buffer |
| `<leader>bp` | Normal | Previous buffer |

## Window Navigation
| Keymap | Mode | Description |
|--------|------|-------------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to bottom window |
| `<C-k>` | Normal | Move to top window |
| `<C-l>` | Normal | Move to right window |

## Window Splitting & Resizing
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<C-Up>` | Normal | Increase window height |
| `<C-Down>` | Normal | Decrease window height |
| `<C-Left>` | Normal | Decrease window width |
| `<C-Right>` | Normal | Increase window width |

## Moving Lines
| Keymap | Mode | Description |
|--------|------|-------------|
| `<A-j>` | Normal | Move line down |
| `<A-k>` | Normal | Move line up |
| `<A-j>` | Visual | Move selection down |
| `<A-k>` | Visual | Move selection up |

## Visual Mode Indenting
| Keymap | Mode | Description |
|--------|------|-------------|
| `<` | Visual | Indent left and reselect |
| `>` | Visual | Indent right and reselect |

## File Navigation
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>e` | Normal | Open file explorer |
| `<leader>ff` | Normal | Find file |

## Configuration
| Keymap | Mode | Description |
|--------|------|-------------|
| `<leader>rc` | Normal | Edit config (init.lua) |

## LSP Keymaps
*These keymaps are only active when LSP is attached to a buffer*

| Keymap | Mode | Description |
|--------|------|-------------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Show references |
| `gi` | Normal | Go to implementation |
| `K` | Normal | Show documentation |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code actions |

## LSP Completion
| Keymap | Mode | Description |
|--------|------|-------------|
| `<Leader><Space>` | Insert | Trigger LSP completion |

## Notes
- All keymaps use descriptive descriptions that can be viewed with help systems
- LSP keymaps are automatically configured when LSP attaches to a buffer
- Window navigation uses standard Vim conventions with Ctrl key
- Leader-based keymaps follow logical groupings for easy memorization