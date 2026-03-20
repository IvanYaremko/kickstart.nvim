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
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          -- 1. Keymaps
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          map('grn', vim.lsp.buf.rename, 'Rename')
          map('gra', vim.lsp.buf.code_action, 'Code Action')
          map('grd', require('telescope.builtin').lsp_definitions, 'Definition')

          -- 2. Format on save
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = event.buf,
            callback = function()
              vim.lsp.buf.format { bufnr = event.buf, async = false }
            end,
            desc = 'Format on save',
          })

          -- 3. Document Highlighting (Matching variables)
          if client and client.supports_method 'textDocument/documentHighlight' then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end, -- End of single unified callback
      })

      -- Custom hover handler
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        max_width = math.floor(vim.o.columns * 0.7),
        border = 'rounded',
        focusable = true,
      })

      -- Turn off the off-screen virtual text
      vim.diagnostic.config { virtual_text = false }

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      -- Re-enable gopls and lua_ls if you need them!
      local servers = {
        gopls = {},
        ts_ls = {},
        lua_ls = {},
      }

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
