-- Harpoon for quick file navigation
local settings = require 'config.settings'

return {
  'ThePrimeagen/harpoon',
  enabled = settings.is_enabled('editor', 'harpoon'),
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = 'Harpoon a file' })

    vim.keymap.set('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon quick menu' })

    -- Loop for numbered Harpoon files (h1-h5)
    for i = 1, 5 do
      vim.keymap.set('n', '<leader>h' .. i, function()
        harpoon:list():select(i)
      end, { desc = 'Harpoon to file ' .. i })
    end

    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon previous' })

    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end, { desc = 'Harpoon next' })

    -- Telescope integration (lazy-loaded when invoked)
    vim.keymap.set('n', '<C-e>', function()
      local harpoon_files = harpoon:list()
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      local conf = require('telescope.config').values
      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end, { desc = 'Open harpoon window' })
  end,
}
