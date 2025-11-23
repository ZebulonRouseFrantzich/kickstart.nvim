-- Render markdown in neovim
local settings = require 'config.settings'

return {
  'MeanderingProgrammer/render-markdown.nvim',
  enabled = settings.is_enabled('ui', 'render-markdown'),
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  opts = {},
}
