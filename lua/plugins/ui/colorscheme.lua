-- Tokyonight colorscheme
local settings = require 'config.settings'

return {
  'folke/tokyonight.nvim',
  enabled = settings.is_enabled('ui', 'colorscheme'),
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = {
        comments = { italic = false },
      },
    }
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
