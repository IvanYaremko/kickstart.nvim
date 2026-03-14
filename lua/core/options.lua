-- Make line numbers default
-- vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Don't show mode (already in statusline)
vim.o.showmode = false

-- Sync clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent & undo history
vim.o.breakindent = true
vim.o.undofile = true

-- Case-insensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on
vim.o.signcolumn = 'yes'

-- Decrease update times
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Configure splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Whitespace display
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Live substitutions & Cursorline
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- Folding configuration
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldcolumn = '0' -- Set to '1' if you want to see a visual fold bar
vim.o.foldlevel = 99   -- Ensure files open with all folds expanded by default
vim.o.foldlevelstart = 99
