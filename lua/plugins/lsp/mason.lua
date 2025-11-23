-- Mason tool installer
local settings = require 'config.settings'

return {
  'mason-org/mason.nvim',
  enabled = settings.is_enabled('lsp', 'mason'),
  opts = {},
}
