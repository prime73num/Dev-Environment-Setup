local util = require("AHua.util")
local keymap = vim.keymap -- for conciseness

local goto_window_with_ft = function(filetype)
  local winnr = util.get_winnr_with_filetype(filetype)
  if winnr == nil then
    print("No such Window!")
    return winnr
  end
  vim.api.nvim_set_current_win(winnr)
  return winnr
end

local get_main_winnr = function ()
  local list = vim.api.nvim_list_wins()
  for i, winnr in ipairs(list) do
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
    if ft ~= "neo-tree" and ft ~= "floaterm" then
      return winnr
    end
  end
  return nil
end

keymap.set("n", ".f", function()
  local winnr = goto_window_with_ft("neo-tree")
  if winnr==nil then
    vim.cmd("Neotree filesystem reveal left")
  end
end, { desc = "goto neo-tree or open neo-tree" })

keymap.set("n", ".a", function()
  local winnr = goto_window_with_ft("floaterm")
  if winnr==nil then
    vim.cmd("FloatermToggle")
  end
end, { desc = "goto floaterm or open floaterm" })

keymap.set("n", ".d", function()
  local winnr = get_main_winnr()
  vim.api.nvim_set_current_win(winnr)
end, { desc = "goto floaterm or open floaterm" })
