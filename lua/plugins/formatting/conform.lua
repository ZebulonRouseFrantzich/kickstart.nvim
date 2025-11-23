-- Autoformat
local settings = require 'config.settings'

return {
  'stevearc/conform.nvim',
  enabled = settings.is_enabled('formatting', 'conform'),
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'n',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      enabled = false,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
    },
  },
}
