local settings = require 'config.settings'

return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    enabled = settings.is_enabled('ui', 'indent-line'),
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
}
