return {
  dir = "highlight",
  name = "AHUa.highlight",
  event = "VeryLazy",
  config = function()
    local util = require("AHua.util")
    local c = require("AHua.color")
    local custom_hl_group = {
      Text = { fg = c.black, bg = "none" },
      BoldText = { fg = c.black, bg = c.base_50, bold = true },
      menu = { fg = c.black, bg = c.base_50, blend = 15 },
      menusel = { fg = c.green_dark, bg = c.base_150 , bold = true },
      match = { fg = c.red, bg = "none" , bold = true },
      purple = { fg = c.purple, bg = "none" },

      green = { fg = c.paper, bg = c.cyan_light },
      blue = { fg = c.paper, bg = c.blue_light },
      red = { fg = c.paper, bg = c.red },

      hi_yank = { fg = c.black, bg = c.blue_light },

      DiagnosticError = { fg = c.red, bg = "none" },
      DiagnosticWarn = { fg = c.orange_dark, bg = "none" },
      DiagnosticInfo = { fg = c.blue_dark, bg = "none" },
      DiagnosticHint = { fg = c.grey_dark, bg = "none" },

      -- IncSearch = { fg = c.black, bg = c.white },


      -- Cmp
      --[[ --
      CmpItemAbbrDeprecated = { fg = "#808080", bg = "none" },

      CmpItemAbbrMatch = { fg = c.orange_dark, bg = "none" },
      CmpItemAbbrMatchFuzzy = { fg = c.orange_dark, bg = "none" },

      CmpItemKindVariable = { fg = c.red, bg = "none" },
      CmpItemKindInterface = { fg = c.red, bg = "none" },
      CmpItemKindText = { fg = c.red, bg = "none" },

      CmpItemKindFunction = { fg = c.purple, bg = "none" },
      CmpItemKindMethod = { fg = c.purple, bg = "none" },

      CmpItemKindKeyword = { fg = c.blue_dark, bg = "none" },
      CmpItemKindProperty = { fg = c.blue_dark, bg = "none" },
      CmpItemKindUnit = { fg = c.blue_dark, bg = "none" },
 ]]


      GitSignsAdd = { link = "green" },
      GitSignsChange = { link = "blue" },
      GitSignsDelete = { link = "red" },

      TelescopeMatching = { link = "match" },
      TelescopeNormal = { link = "menu" },
      TelescopeSelection = { link = "menusel" },

      PmenuSel = { link = "menusel" },
      Pmenu = { link = "menu" },
      CmpItemAbbrMatch = { link = "match" },
      CmpItemAbbrMatchFuzzy = { link = "match" },

      Search = { link = "BoldText" },
      WinSeparator = { link = "Text" },

      ["@variable"] = { link = "Text"},
      ["@property"] = { link = "Text"},
      ["@keyword"] = { link = "SpecialChar"},
      ["@type"] = { link = "Identifier"},
    }

    util.hl(custom_hl_group)
  end,
}
