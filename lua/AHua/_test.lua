local util = require("AHua.util")
print("Hello this is AHua test")

local groups = {
  fg = '#8899  aaa',
  bg = "fuasd",
  bold = "true",
}
local args = {}
util.attri_to_str(args, groups)
print(vim.inspect(args))
