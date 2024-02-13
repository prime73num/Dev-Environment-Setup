return {
  {
    "ggandor/leap.nvim",
    config = function()
      local color = require("AHua.color")
      require("leap").create_default_mappings()
      require("leap.user").set_repeat_keys(";", ",", {
        relative_directions = true,
        modes = { "n", "x", "o" },
      })
      vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
        fg = "black",
        bg = color.base_150,
        bold = false,
        nocombine = false,
      })
      vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
        fg = "black",
        bg = color.base_150,
        bold = false,
        nocombine = false,
      })
    end,
  },
}
