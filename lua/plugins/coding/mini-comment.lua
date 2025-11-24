-- Comment lines
local settings = require 'config.settings'

return {
  'nvim-mini/mini.comment',
  enabled = settings.is_enabled('coding', 'mini-comment'),
  version = false,
  keys = {
    { 'gc', mode = { 'n', 'x' }, desc = 'Comment toggle' },
    { 'gcc', mode = 'n', desc = 'Comment toggle line' },
  },
  config = function()
    require('mini.comment').setup()
  end,
}
