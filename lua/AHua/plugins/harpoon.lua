return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set(
      "n",
      "<leader>mm",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      { desc = "Mark file with harpoon" }
    )
    keymap.set(
      "n",
      "<leader>hm",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { desc = "Toggle quick menu" }
    )
    keymap.set(
      "n",
      "<leader>gh",
      "<cmd>lua require('harpoon.ui').nav_file(vim.v.count)<cr>",
      { desc = "Go to harpoon num" }
    )
  end,
}
