return {
  {
    'ndsl6211/nvim-gemini-cli',
    build = 'cd server && go build -o ../bin/gemini-mcp-server',
    config = function()
      require('gemini-cli').setup({
        -- This enables leader keymaps:
        -- <leader>gc : Toggle Chat (Split)
        -- <leader>gf : Toggle Chat (Float)
        -- <leader>ga : Send current file/selection to context
        shell = 'bash',
        setup_keymaps = true,
        ide = { enabled = false },
      })
    end,
  },
}
