-- LazyGit integration
local settings = require 'config.settings'

return {
  'kdheepak/lazygit.nvim',
  enabled = settings.is_enabled('git', 'lazygit'),
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
  },
}
