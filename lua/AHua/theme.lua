local util = require("AHua.util")
local c = require("AHua.color")
local custom_hl = {
  ["WinSeparator"] = { guifg = c.black, guibg = "NONE" },

  ["TelescopePreviewTitle"] = { guifg = c.black, guibg = c.blue_light },
  ["TelescopeMatching"] = { guifg = c.orange_dark, guibg = "NONE", gui = "bold" },

  ["DiagnosticError"] = { guifg = c.red, guibg = "NONE" },
  ["DiagnosticWarn"] = { guifg = c.orange_dark, guibg = "NONE" },
  ["DiagnosticInfo"] = { guifg = c.blue_dark, guibg = "NONE" },
  ["DiagnosticHint"] = { guifg = c.grey_dark, guibg = "NONE" },
}

util.highlight(custom_hl)