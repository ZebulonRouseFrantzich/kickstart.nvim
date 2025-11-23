-- Health checks for core configuration
local M = {}

M.check = function()
  vim.health.start('Custom Config')
  
  -- Check leader key
  if vim.g.mapleader == ' ' then
    vim.health.ok('Leader key is set to space')
  else
    vim.health.error('Leader key not set correctly')
  end
  
  -- Check lazy.nvim is loaded
  if pcall(require, 'lazy') then
    vim.health.ok('lazy.nvim is loaded')
  else
    vim.health.error('lazy.nvim failed to load')
  end
  
  -- Check core modules
  local core_modules = { 'config.options', 'config.keymaps', 'config.autocmds' }
  for _, mod in ipairs(core_modules) do
    if pcall(require, mod) then
      vim.health.ok(string.format('%s loaded successfully', mod))
    else
      vim.health.error(string.format('%s failed to load', mod))
    end
  end
  
  -- Check important options
  if vim.o.number then
    vim.health.ok('Line numbers enabled')
  else
    vim.health.warn('Line numbers disabled')
  end
  
  if vim.opt.relativenumber:get() then
    vim.health.ok('Relative line numbers enabled')
  else
    vim.health.info('Relative line numbers disabled')
  end
  
  -- Run LSP health checks (if available)
  local lsp_health_ok, lsp_health = pcall(require, 'config.health.lsp')
  if lsp_health_ok and lsp_health.check then
    lsp_health.check()
  end
end

return M
