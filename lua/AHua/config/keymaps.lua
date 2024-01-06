-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local new_command = vim.api.nvim_create_user_command
---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode

-- clear search highlights

keymap.set("n", "<leader>i", "ciw", { desc = "Change in word" })
keymap.set("n", "<leader>;", ":", { desc = "Command line" })
keymap.set("n", "<leader>w", "<C-w>", { desc = "Window command prefix" })
keymap.set("n", "<leader>q", "<C-w>c", { desc = "Close window" })
keymap.set("n", "a", "$a", { desc = "Append in line" })
keymap.set("n", "J", "3<C-e>3j", { desc = "Move up fast" })
keymap.set("n", "K", "3<C-y>3k", { desc = "Move down fast" })
keymap.set("n", "<leader>e", "<cmd>e #<cr>", { desc = "Go to last buffer" })
keymap.set("n", "0", "^", { desc = "Go to line begin" })
keymap.set("n", "<cr>", "$", { desc = "Go to line end" })
keymap.set("n", "U", "u", { desc = "Undo" })


new_command(
  'AHuaTest',
  function(opts)
    vim.cmd("source $HOME/.config/nvim/lua/AHua/_test.lua")
  end,
  {}
)

