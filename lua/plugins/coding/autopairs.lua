-- autopairs
-- https://github.com/windwp/nvim-autopairs

local settings = require 'config.settings'

return {
  'windwp/nvim-autopairs',
  enabled = settings.is_enabled('coding', 'autopairs'),
  event = 'InsertEnter',
  opts = {},
}
