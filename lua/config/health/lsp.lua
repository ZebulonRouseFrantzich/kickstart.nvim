-- Health checks for LSP configuration
local M = {}

M.check = function()
  vim.health.start('LSP Configuration')
  
  -- Check if lspconfig is available
  if pcall(require, 'lspconfig') then
    vim.health.ok('lspconfig is available')
  else
    vim.health.error('lspconfig not found')
    return
  end
  
  -- Check active LSP clients
  local clients = vim.lsp.get_active_clients()
  if #clients > 0 then
    vim.health.ok(string.format('%d LSP client(s) active', #clients))
    for _, client in ipairs(clients) do
      vim.health.info(string.format('  - %s', client.name))
    end
  else
    vim.health.warn('No LSP clients currently active')
  end
  
  -- Check Mason
  if pcall(require, 'mason') then
    vim.health.ok('Mason is installed')
  else
    vim.health.error('Mason not found')
  end
  
  -- Check blink.cmp
  if pcall(require, 'blink.cmp') then
    vim.health.ok('blink.cmp is installed')
  else
    vim.health.warn('blink.cmp not found')
  end
end

return M
