-- Set leader keys first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load core settings and keymaps
require('core.options')
require('core.keymaps')

-- 1. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.have_nerd_font = true

-- 2. Setup lazy.nvim and import the plugins folder
require('lazy').setup({
  -- Simple plugins that don't need their own file
  'NMAC427/guess-indent.nvim',
  'tpope/vim-sleuth',

  -- This tells Lazy to look at every .lua file in ~/.config/nvim/lua/plugins/
  -- and treat it as a plugin specification.
  { import = 'plugins' },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to {}
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘', config = '🛠', event = '📅', ft = '📂', init = '⚙', keys = '🗝',
      plugin = '🔌', runtime = '💻', require = '🌙', source = '📄', start = '🚀', task = '📌', lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
