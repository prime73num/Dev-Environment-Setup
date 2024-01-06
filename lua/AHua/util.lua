local util = {}
local hl = vim.api.nvim_set_hl


util.attri_to_str = function(args, opts)
  for name, attri in pairs(opts) do
    local str = name.."="..attri
    table.insert(args, str)
  end
  return args
end


util.highlight = function(hl_groups)
  for group, highlight in pairs(hl_groups) do
    local args = {}
    table.insert(args, group)
    util.attri_to_str(args, highlight)
    vim.cmd.highlight(args)
  end
end



return util
