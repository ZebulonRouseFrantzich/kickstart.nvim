-- nvim-ts-autotag
-- https://github.com/windwp/nvim-ts-autotag

local settings = require 'config.settings'

return {
  'windwp/nvim-ts-autotag',
  enabled = settings.is_enabled('coding', 'nvim-ts-autotag'),
  event = 'VeryLazy',
  opts = {},
}
