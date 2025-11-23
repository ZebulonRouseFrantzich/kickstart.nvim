-- Lua LSP for Neovim config
local settings = require 'config.settings'

return {
  'folke/lazydev.nvim',
  enabled = settings.is_enabled('utils', 'lazydev'),
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}
