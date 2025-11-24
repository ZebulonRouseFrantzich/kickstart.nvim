-- lua/config/lsp_picker_keymaps.lua
-- Central registry for LSP picker keymap setup functions.
-- This module allows picker plugins (Telescope, mini.pick) to register
-- their LSP keymap implementations without using global variables.

local M = {}

-- The registered setup function, if any.
local registered

--- Register a picker-specific LSP keymap setup function.
--- The first registration wins (first enabled picker gets priority).
---@param setup_fn fun(map: fun(keys: string, func: function, desc: string, mode?: string|string[]))
function M.register(setup_fn)
  if not registered then
    registered = setup_fn
  end
end

--- Call the registered setup function, if present.
--- @param map fun(keys: string, func: function, desc: string, mode?: string|string[])
--- @return boolean used_picker true if a picker was used, false for "no picker"
function M.setup(map)
  if registered then
    registered(map)
    return true
  end
  return false
end

return M
