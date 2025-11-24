-- Navigate and manipulate file system
local settings = require 'config.settings'

return {
  'nvim-mini/mini.files',
  enabled = settings.is_enabled('editor', 'mini-files'),
  version = false,
  keys = {
    {
      '<leader>e',
      function()
        local MiniFiles = require 'mini.files'
        MiniFiles.open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = 'Open mini.files (current file)',
    },
    {
      '<leader>E',
      function()
        local MiniFiles = require 'mini.files'
        local cwd = vim.uv and vim.uv.cwd() or vim.loop.cwd()
        MiniFiles.open(cwd, true)
      end,
      desc = 'Open mini.files (cwd)',
    },
  },
  config = function()
    require('mini.files').setup {
      -- Customization of shown content
      content = {
        filter = nil,
        prefix = nil,
        sort = nil,
      },
      -- Module mappings created only inside explorer.
      mappings = {
        close = 'q',
        go_in = 'l',
        go_in_plus = 'L',
        go_out = 'h',
        go_out_plus = 'H',
        mark_goto = "'",
        mark_set = 'm',
        reset = '<BS>',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
      -- General options
      options = {
        -- Whether to use for editing directories
        use_as_default_explorer = false,
      },
      -- Customization of explorer windows
      windows = {
        -- Whether to show preview of file/directory under cursor
        preview = false,
        width_focus = 30,
        width_nofocus = 15,
        width_preview = 50,
      },
    }
  end,
}
