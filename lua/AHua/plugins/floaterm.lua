return {
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_autoinsert = false
      vim.g.floaterm_wintype = "split"
      vim.g.floaterm_position = "rightbelow"
      vim.g.floaterm_height = 0.3

      vim.keymap.set("n", "<leader><cr>", function()
        local line = vim.fn.getline(".")
        vim.cmd("FloatermToggle")
        vim.cmd("FloatermSend "..line)
      end, { desc = "Toggle terminal" })
    end,
  },
}
