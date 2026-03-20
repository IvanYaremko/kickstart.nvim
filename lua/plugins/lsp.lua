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
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function()
              vim.lsp.buf.format { bufnr = event.buf, async = false }
            end,
            desc = 'Format on save',
          })
        end,
      })

      -- Custom hover handler
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        -- math.floor(vim.o.columns * 0.7) calculates the value at the moment the LSP loads
        max_width = math.floor(vim.o.columns * 0.7),
        border = 'rounded',
        focusable = true, -- Allows you to jump into the window with K again
      })
      -- Turn off the off-screen virtual text
      vim.diagnostic.config { virtual_text = false }

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = { gopls = {}, ts_ls = {}, lua_ls = {} }

      require('mason-tool-installer').setup { ensure_installed = { 'stylua', 'gopls' } }
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
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

