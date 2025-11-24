-- mini.pick - Fast and simple picker
local settings = require 'config.settings'
local lsp_picker = require 'config.lsp_picker_keymaps'

return {
  'nvim-mini/mini.pick',
  enabled = settings.is_enabled('editor', 'mini-pick'),
  version = false,
  dependencies = {
    -- mini.extra provides additional pickers including LSP integration
    { 'nvim-mini/mini.extra', version = false },
  },
  config = function()
    local pick = require 'mini.pick'

    -- Use default configuration (no need to specify defaults)
    pick.setup {}

    -- Set up vim.ui.select override
    vim.ui.select = pick.ui_select

    -- Keymaps for mini.pick
    local extra = require 'mini.extra'

    -- File pickers
    vim.keymap.set('n', '<leader>sh', pick.builtin.help, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sf', pick.builtin.files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', pick.builtin.grep_live, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sw', function()
      pick.builtin.grep { pattern = vim.fn.expand '<cword>' }
    end, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sd', extra.pickers.diagnostic, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', pick.builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', extra.pickers.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', pick.builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Search in current buffer
    vim.keymap.set('n', '<leader>/', function()
      pick.builtin.grep_live { scope = 'current' }
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Search in open files
    vim.keymap.set('n', '<leader>s/', extra.pickers.buf_lines, { desc = '[S]earch [/] in Open Files' })

    -- Search Neovim config files
    vim.keymap.set('n', '<leader>sn', function()
      pick.builtin.files { tool = 'git', source = { cwd = vim.fn.stdpath 'config' } }
    end, { desc = '[S]earch [N]eovim files' })

    -- Register LSP picker keymaps for lspconfig.lua
    -- This allows lspconfig to use mini.pick for LSP operations when mini.pick is enabled
    lsp_picker.register(function(map)
      map('grr', function()
        extra.pickers.lsp { scope = 'references' }
      end, '[G]oto [R]eferences')
      map('gri', function()
        extra.pickers.lsp { scope = 'implementation' }
      end, '[G]oto [I]mplementation')
      map('grd', function()
        extra.pickers.lsp { scope = 'definition' }
      end, '[G]oto [D]efinition')
      map('gO', function()
        extra.pickers.lsp { scope = 'document_symbol' }
      end, 'Open Document Symbols')
      map('gW', function()
        extra.pickers.lsp { scope = 'workspace_symbol' }
      end, 'Open Workspace Symbols')
      map('grt', function()
        extra.pickers.lsp { scope = 'type_definition' }
      end, '[G]oto [T]ype Definition')
    end)
  end,
}
