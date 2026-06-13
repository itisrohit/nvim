# Neovim Configuration

A simple Neovim setup for coding.

Neovim install:
- Official site: https://neovim.io/
- GitHub releases: https://github.com/neovim/neovim/releases

## Screenshots

### Package Management with Lazy.nvim
![Packages](screenshots/packages.png)

### Finding Files with Telescope
![Find Files](screenshots/findfiles.png)

### Live Grep for Searching
![Live Grep](screenshots/livegrep.png)

### Code Display
![Code Display](screenshots/show.png)

## What You Get

- File explorer
- Better syntax highlighting
- Fast file search
- Code completion and LSP support
- Keybinding popup help with which-key
- Session restore
- Quick jump navigation
- Autosave
- Mouse support
- Persistent undo history
- GitHub Copilot inline suggestions
- Git helpers
- Debugging tools
- Catppuccin theme

## Installation

0. Make sure `nvim` is installed first using one of the links above.

1. Clone this repo:
```bash
git clone https://github.com/itisrohit/nvim.git ~/.config/nvim
```

2. Open Neovim:
```bash
nvim
```

3. Let the plugins install.

4. If plugin installs fail, run:
```vim
:Lazy sync
```

## Main Shortcuts

- Press `Space` and wait a moment to see the main shortcuts on screen
- `Space e` opens or closes the file sidebar
- `Space f f` finds files
- `Space f s` searches text across files
- `Space z` undoes the last change
- `Space Shift-z` redoes the last undone change
- `Space y` copies to system clipboard
- `Space p` pastes from system clipboard
- `K` explains the thing under your cursor
- `Space d` jumps to where the current thing was first defined
- `Space r` shows other places where the current thing is used
- `Space a` shows available code actions like quick fixes, rename help, or import cleanup
- `Space g f` formats the current file
- `Space g p` previews the current git change
- `Space b` toggles git blame
- `Space j` jumps to visible text on screen
- `Space q s` restores the saved session for the current folder
- `Space q l` restores the last session

## Common Commands

- `:w` saves the current file
- `:q` quits the current window
- `:q!` force closes the current window without saving
- `:wq` saves and quits
- `:qa!` force quits everything without saving
- `:terminal` opens a terminal inside Neovim
- `:split` opens a horizontal split
- `:vsplit` opens a vertical split
- `:help` opens Neovim help
- `:help :terminal` explains how terminal works
- `:commands` shows available commands

## Plugin Commands

- `:Lazy` opens the plugin manager
- `:Lazy sync` installs and updates plugins
- `:Lazy clean` removes unused plugins
- `:Lazy restore` restores plugins from the lockfile
- `:Mason` opens the LSP/tool installer

## Discovering Shortcuts

- Press `Space` and pause briefly to open the which-key popup
- It shows the main shortcuts in plain English so you do not need to memorize them all
- Use it like a cheat sheet: press `Space`, read the options, then press the next key
- If you see a group like `f` or `g`, press that key next to see more related commands

## Sessions

- `Space q s` restores the saved session for the current folder
- `Space q l` restores the last session
- `Space q d` stops session saving for the current Neovim run

## Quick Jump

- `Space j` shows jump labels on visible text
- Type the shown letters to jump directly there

## Neo-tree

- Open the sidebar with `Space e`
- The sidebar refreshes automatically when files change
- `a` creates a new file
- `A` creates a new folder
- `r` renames
- `d` deletes
- `Enter` opens a file
- `q` closes the sidebar

## Editing Behavior

- Files autosave while you work
- Mouse click and scroll are enabled
- Undo history is saved between sessions

## Copilot

- Open a file and go into Insert mode to get suggestions
- `Tab` accepts the suggestion
- `Ctrl-]` dismisses the suggestion
- If Copilot is not working, run `:Copilot status`
- If Copilot is not signed in yet, run `:Copilot setup`
- After setup, restart Neovim and test again in a real code file

## Language Support

Built-in support includes:
- TypeScript/JavaScript (ts_ls)
- Python (basedpyright + Ruff)
- Lua (lua_ls)
- Rust (rust_analyzer)
- Go (gopls)

You can add more language servers later through Mason.

Python support uses:
- `basedpyright` for code understanding, go to definition, references, and type checking
- `Ruff` for linting, formatting, and import cleanup

## Formatting and Linting

Formatting and linting currently use:
- Lua formatting with stylua
- JavaScript/TypeScript formatting with prettier
- Python linting and formatting with Ruff

## Dependencies

- Neovim >= 0.11.0
- Git (for plugin installation)
- `ripgrep` for fast text search with Telescope
- `make` is useful for some plugins
- A Nerd Font for icons (recommended)
- Tmux (optional, for tmux integration)

## Editing The Config

- Change plugin settings in `lua/plugins/`
- Change basic Neovim options in `lua/vim-options.lua`
