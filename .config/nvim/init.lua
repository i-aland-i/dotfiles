-- Use system clipboard for Neovim
vim.opt.clipboard = "unnamedplus"

-- Disable unused built-in plugins to improve startup time
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1

-- Enable line numbers and relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable line wrapping
vim.wo.wrap = true

-- Set a basic color scheme (can switch to any available theme you like)
vim.cmd([[colorscheme desert]])

-- Set space as the leader key (for ease of keybindings)
vim.g.mapleader = " "

-- Enable mouse support
vim.o.mouse = "a"

-- Basic indentation settings (for ease of use, can switch to tabs if preferred)
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true

-- Enable search highlight and incremental search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Set cursor line and column highlighting for better visual feedback
vim.wo.cursorline = true
vim.wo.cursorcolumn = true

-- Set up clipboard support (uses system clipboard)
vim.o.clipboard = "unnamedplus"

-- Set up key mappings for copy-pasting (Ctrl+C and Ctrl+V)
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })  -- Copy to clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })  -- Copy to clipboard (in visual mode)
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })  -- Paste from clipboard
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })  -- Paste from clipboard (in visual mode)

-- Optional: Set up the default text width for better formatting (optional)
vim.o.textwidth = 80

-- Set up default file encoding to UTF-8
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- Allow undo history across sessions
vim.o.undofile = true

-- Set up a simple status line with basic information
vim.o.statusline = "%f %y %m %l/%L %c"

-- Hide the command line when not in use (keeps UI clean)
vim.o.cmdheight = 1

-- Set auto-save
vim.cmd([[autocmd TextChanged,TextChangedI * silent! write]])

-- Disable swap files
vim.o.swapfile = false

-- Optional: If you want to enable syntax highlighting (very simple)
vim.cmd([[syntax enable]])

-- Keep it simple, fast, and easy to use
vim.o.hidden = true
vim.o.splitright = true
vim.o.splitbelow = true

