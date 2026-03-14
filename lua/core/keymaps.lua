-- Clear highlights on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ git keymaps ]]
--vim.keymap.set('n', '<leader>ga', ':!git add %<CR>', { desc = 'Git Add Current' })
--vim.keymap.set('n', '<leader>gA', ':!git add .<CR>', { desc = 'Git Add All' })
--vim.keymap.set('n', '<leader>gc', ':!git commit -m "update"<CR>', { desc = 'Git Commit' })
--vim.keymap.set('n', '<leader>gp', ':!git push<CR>', { desc = 'Git Push' })
--
-- gemini sync
vim.keymap.set('n', '<leader>gr', '<cmd>GeminiSync<CR>', { desc = 'Git [R]efresh AI Context' })
-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
