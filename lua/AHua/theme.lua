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
  ["Search"] = { guifg = c.black, guibg = c.base_100 , gui = "bold"},

  ["FlashLabel"] = { guifg = c.black, guibg = c.base_100 },
  ["IncSearch"] = { guifg = c.black, guibg = c.white },

  ["PmenuSel"] = { guifg = c.black, guibg = c.base_150 },

  -- Cmp
  --
  ["CmpItemAbbrDeprecated"] = { guifg = "#808080", guibg = "NONE" },

  ["CmpItemAbbrMatch "] = { guifg = c.orange_dark, guibg = "NONE" },
  ["CmpItemAbbrMatchFuzzy"] = { guifg = c.orange_dark, guibg = "NONE" },

  ["CmpItemKindVariable"] = { guifg = c.red, guibg = "NONE" },
  ["CmpItemKindInterface"] = { guifg = c.red, guibg = "NONE" },
  ["CmpItemKindText"] = { guifg = c.red, guibg = "NONE" },

  ["CmpItemKindFunction"] = { guifg = c.purple, guibg = "NONE" },
  ["CmpItemKindMethod"] = { guifg = c.purple, guibg = "NONE" },

  ["CmpItemKindKeyword"] = { guifg = c.blue_dark, guibg = "NONE" },
  ["CmpItemKindProperty"] = { guifg = c.blue_dark, guibg = "NONE" },
  ["CmpItemKindUnit"] = { guifg = c.blue_dark, guibg = "NONE" },


}

util.highlight(custom_hl)
