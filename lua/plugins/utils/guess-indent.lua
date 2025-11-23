-- Detect tabstop and shiftwidth automatically
local settings = require 'config.settings'

return {
  'NMAC427/guess-indent.nvim',
  enabled = settings.is_enabled('utils', 'guess-indent'),
  event = { 'BufReadPre', 'BufNewFile' },
}
