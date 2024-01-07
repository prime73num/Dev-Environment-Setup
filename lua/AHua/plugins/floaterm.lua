return {
  {
    "voldikss/vim-floaterm",
    config = function()

      vim.g.floaterm_autoinsert = false
      vim.g.floaterm_wintype = "split"
      vim.g.floaterm_position = "rightbelow"
      vim.g.floaterm_height = 0.3


      vim.keymap.set("n", ".", "<cmd>FloatermToggle<cr>", { desc = "Toggle terminal" })
    end,
  },
}
