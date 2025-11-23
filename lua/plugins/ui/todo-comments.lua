-- Highlight todo, notes, etc in comments
local settings = require 'config.settings'

return {
  'folke/todo-comments.nvim',
  enabled = settings.is_enabled('ui', 'todo-comments'),
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
