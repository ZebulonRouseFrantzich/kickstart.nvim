-- Icon provider
local settings = require 'config.settings'

return {
  'nvim-mini/mini.icons',
  enabled = settings.is_enabled('ui', 'mini-icons'),
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    local icons = require 'mini.icons'
    icons.setup {
      -- Icon style. Can be 'glyph' (default) or 'ascii'
      style = 'glyph',
      -- Customize icons per category
      default = {},
      directory = {},
      extension = {},
      file = {},
      filetype = {},
      lsp = {},
      os = {},
    }
    -- Make 'mini.icons' provide icons for other plugins
    icons.mock_nvim_web_devicons()
  end,
}
