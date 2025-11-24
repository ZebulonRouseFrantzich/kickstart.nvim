-- Animate common Neovim actions
local settings = require 'config.settings'

return {
  'nvim-mini/mini.animate',
  enabled = settings.is_enabled('ui', 'mini-animate'),
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.animate').setup {
      -- Cursor path
      cursor = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear { duration = 100, unit = 'total' },
      },
      -- Vertical scroll
      scroll = {
        enable = true,
        timing = require('mini.animate').gen_timing.linear { duration = 150, unit = 'total' },
      },
      -- Window resize
      resize = {
        enable = false,
      },
      -- Window open/close
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    }
  end,
}
