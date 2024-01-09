return {
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_enabled = 1
      vim.g.matchup_motion_enabled = 1
      vim.g.matchup_text_obj_enabled = 0
      vim.keymap.set("n", "u", "<plug>(matchup-%)", { desc = "go to pairs" })
      vim.keymap.set("n", "gu", "<plug>(matchup-g%)", { desc = "go to pairs" })
      vim.keymap.set("n", "[u", "<plug>(matchup-[%)", { desc = "go to pairs" })
      vim.keymap.set("n", "]u", "<plug>(matchup-]%)", { desc = "go to pairs" })
      vim.keymap.set("n", "zu", "<plug>(matchup-z%)", { desc = "go to pairs" })
    end,
  },
}
