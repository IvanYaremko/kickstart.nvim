return {
  -- Colorscheme
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  },

  -- Trouble (for error list)
  {
    'folke/trouble.nvim',
    opts = {},
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
    },
  },

  -- Neo-tree (Explorer on the Right)
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    config = function()
      require('neo-tree').setup({
        window = { position = 'left', width = 30 },
      })
      vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Explorer' })
    end,
  },

  -- Statusline & Which-key
  { 'folke/which-key.nvim', event = 'VimEnter', opts = { delay = 0 } },
  { 'echasnovski/mini.nvim', config = function() require('mini.statusline').setup() end },
}
