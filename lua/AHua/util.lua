local util = {}
local hl = vim.api.nvim_set_hl

util.attri_to_str = function(args, opts)
  for name, attri in pairs(opts) do
    local str = name .. "=" .. attri
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

util.open_finder = function()
  os.execute("open .")
end
util.get_parent_dir = function(dir)
  if dir == "" or dir == "/" or string.match(dir, "^[A-z]:/$") ~= nil then
    return dir
  end
  return vim.fn.fnamemodify(vim.fs.normalize(dir), ":h")
end

util.get_winnr_with_filetype = function(filetype)
  local list = vim.api.nvim_list_wins()
  for i, winnr in ipairs(list) do
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
    if ft == filetype then
      return winnr
    end
  end
  return nil
end

return util
