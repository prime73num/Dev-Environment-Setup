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
keymap.set("n", "A", "hea", { desc = "Append after word" })
keymap.set("n", "J", "3<C-e>3j", { desc = "Move up fast" })
keymap.set("n", "K", "3<C-y>3k", { desc = "Move down fast" })
keymap.set("n", "<leader>e", "<cmd>e #<cr>", { desc = "Go to last buffer" })
keymap.set("n", "<cr>", "$", { desc = "Go to line end" })
keymap.set("n", "U", "u", { desc = "Undo" })
keymap.set("i", "<c-v>", "<c-r><c-p>*", { desc = "Paste from system clipboard" })





vim.cmd([[
nnoremap <silent> w :call search('\<\w', 'W', line("."))<cr>
nnoremap <silent> e :call search('\w\>', 'W', line("."))<cr>
nnoremap <silent> b :call search('\<\w', 'bW', line("."))<cr>
nnoremap <silent> gE :call search('\w\>', 'bW', line("."))<cr>
]])


-- Source _test.lua to test lua function
new_command(
  'AHuaTest',
  function()
    vim.cmd("source $HOME/.config/nvim/lua/AHua/_test.lua")
  end,
  {}
)

-- Copy from vim register to sys clipboard
new_command(
  'CopyToSys',
  function()
    vim.cmd([[
      let @* = @0
    ]])
  end,
  {}
)

