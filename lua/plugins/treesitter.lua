return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'go',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'vim',
        'vimdoc',
        'python',
        'javascript',
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true,
      max_lines = 5, -- Increase this slightly to fit the function + some nesting
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 1, -- Setting this to 1 prevents multiline 'if' headers from eating space
      trim_scope = 'outer', -- 'outer' keeps the function name, 'inner' keeps the if/else
      mode = 'cursor',

      -- This is the "Magic" setting for your problem:
      patterns = {
        default = {
          'class',
          'function',
          'method',
          -- Removing 'if', 'else', 'for', 'while' from here
          -- will force it to only show the function/class levels.
        },
      },
    },
  },
}
