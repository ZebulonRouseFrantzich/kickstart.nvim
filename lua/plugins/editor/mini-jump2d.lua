-- Jump within visible lines via iterative label filtering
local settings = require 'config.settings'

return {
  'nvim-mini/mini.jump2d',
  enabled = settings.is_enabled('editor', 'mini-jump2d'),
  version = false,
  keys = {
    { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Jump2d' },
  },
  config = function()
    require('mini.jump2d').setup {
      mappings = {
        start_jumping = 'gs',
      },
    }
  end,
}
