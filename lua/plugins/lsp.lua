return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('grn', vim.lsp.buf.rename, 'Rename')
          map('gra', vim.lsp.buf.code_action, 'Code Action')
          map('grd', require('telescope.builtin').lsp_definitions, 'Definition')
        end,
      })

      -- Turn off the off-screen virtual text
      vim.diagnostic.config({ virtual_text = false })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = { gopls = {}, ts_ls = {}, lua_ls = {} }

      require('mason-tool-installer').setup({ ensure_installed = { 'stylua', 'gopls' } })
      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      })
    end,
  },
  -- Autocompletion engine
  {
    'saghen/blink.cmp',
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    },
  },
}
