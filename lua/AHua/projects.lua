-- our picker function: colors
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local tele_builtin = require("telescope.builtin")

local myfinder = finders.new_table({
  results = {
    { "~/.config/nvim" },
    { "~/.config/fish" },
    { "~/W.D/lib" },
    { "~/W.D/01_Paper" },
    { "~/W.D/12_cs143" },
    { "~/W.D/11_Leetcode/" },
  },
  entry_maker = function(entry)
    return {
      value = entry,
      display = entry[1],
      ordinal = entry[1],
      path = entry[1],
    }
  end,
})
local mymappings = function(prompt_bufnr, map)
  actions.select_default:replace(function()
    actions.close(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    tele_builtin.find_files({
      cwd = selection.path,
    })
  end)
  return true
end

local project = function(opts)
  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = "MY PROJECT",
      sorter = conf.generic_sorter(opts),
      finder = myfinder,
      attach_mappings = mymappings,
    })
    :find()
end

return project
