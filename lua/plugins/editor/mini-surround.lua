-- Add/delete/replace surroundings (brackets, quotes, etc.)
local settings = require 'config.settings'

return {
  'nvim-mini/mini.surround',
  enabled = settings.is_enabled('editor', 'mini-surround'),
  version = false,
  event = 'VeryLazy',
  config = function()
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    require('mini.surround').setup()
  end,
}
