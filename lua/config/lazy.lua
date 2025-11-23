-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
-- Build the spec table dynamically
local spec = {
  -- Import all plugin modules from lua/plugins/
  { import = 'plugins.editor' },
  { import = 'plugins.coding' },
  { import = 'plugins.lsp' },
  { import = 'plugins.formatting' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.git' },
  { import = 'plugins.ui' },
  { import = 'plugins.utils' },
}

-- Conditionally add user overrides if the file exists
local user_config = vim.fn.stdpath 'config' .. '/lua/plugins/user.lua'
if vim.fn.filereadable(user_config) == 1 then
  table.insert(spec, { import = 'plugins.user' })
end

require('lazy').setup({
  spec = spec,
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
