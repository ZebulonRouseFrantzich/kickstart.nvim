-- Visualize and work with indent scope
local settings = require 'config.settings'

return {
  'nvim-mini/mini.indentscope',
  enabled = settings.is_enabled('ui', 'mini-indentscope'),
  version = false,
  event = 'VeryLazy',
  config = function()
    require('mini.indentscope').setup {
      -- Draw options
      draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 100,
        -- Animation rule for scope's first drawing
        animation = require('mini.indentscope').gen_animation.none(),
      },
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Textobjects
        object_scope = 'ii',
        object_scope_with_border = 'ai',
        -- Motions (jump to respective border line; if not present - do nothing)
        goto_top = '[i',
        goto_bottom = ']i',
      },
      -- Options which control scope computation
      options = {
        -- Type of scope's border: which line(s) with smaller indent to
        -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
        border = 'both',
        -- Whether to use cursor column when computing reference indent
        indent_at_cursor = true,
        -- Whether to first check input line to be a border of adjacent scope
        try_as_border = false,
      },
      -- Which character to use for drawing scope indicator
      symbol = '│',
    }
  end,
}
