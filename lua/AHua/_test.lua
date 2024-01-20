local util = require("AHua.util")
print("Hello this is AHua test")

local groups = {
  fg = "#8899  aaa",
  bg = "fuasd",
  bold = "true",
}

print(vim.fn.getline("."))

local theme = require('telescope.themes').get_dropdown()
print(vim.inspect(theme))
