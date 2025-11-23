-- File manager
local settings = require 'config.settings'

return {
  'stevearc/oil.nvim',
  enabled = settings.is_enabled('editor', 'oil'),
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
