-- Better Around/Inside textobjects
local settings = require 'config.settings'

return {
  'nvim-mini/mini.ai',
  enabled = settings.is_enabled('editor', 'mini-ai'),
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
  end,
}
