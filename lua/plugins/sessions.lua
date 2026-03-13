return {
  {
    'stevearc/resession.nvim',
    config = function()
      local resession = require('resession')
      resession.setup()

      -- Keymaps to save and load sessions
      vim.keymap.set('n', '<leader>ss', resession.save, { desc = '[S]ession [S]ave' })
      vim.keymap.set('n', '<leader>sl', resession.load, { desc = '[S]ession [L]oad' })
      vim.keymap.set('n', '<leader>sd', resession.delete, { desc = '[S]ession [D]elete' })

      -- Automatically save session on exit
      vim.api.nvim_create_autocmd('VimLeavePre', {
        callback = function()
          -- Saves a session named "last" in the current directory
          resession.save('last', { dir = 'session', notify = false })
        end,
      })
    end,
  },
}
