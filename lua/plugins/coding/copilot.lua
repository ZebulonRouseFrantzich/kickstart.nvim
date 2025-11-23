-- GitHub Copilot
local settings = require 'config.settings'

return {
  'github/copilot.vim',
  enabled = settings.is_enabled('coding', 'copilot'),
  event = 'InsertEnter',
  cmd = { 'Copilot' },
}
