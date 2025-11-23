-- Snippet Engine
local settings = require 'config.settings'

return {
  'L3MON4D3/LuaSnip',
  enabled = settings.is_enabled('coding', 'luasnip'),
  version = '2.*',
  build = (function()
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
  opts = {},
}
