-- TypeScript-specific tools
local settings = require 'config.settings'

return {
  'pmizio/typescript-tools.nvim',
  enabled = settings.is_enabled('lsp', 'typescript-tools'),
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
}
