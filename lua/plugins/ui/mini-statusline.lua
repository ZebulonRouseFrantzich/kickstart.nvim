-- Simple and easy statusline
local settings = require 'config.settings'

return {
  'nvim-mini/mini.statusline',
  enabled = settings.is_enabled('ui', 'mini-statusline'),
  version = false,
  event = 'VeryLazy',
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
