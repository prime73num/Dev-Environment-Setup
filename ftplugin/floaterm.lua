local opt = vim.opt -- for conciseness
opt.number = false -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = false -- show relative line numbers



vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Toggle terminal", buffer = true})
vim.keymap.set("n", "q", "<cmd>FloatermHide<cr>", { desc = "Toggle terminal", buffer = true })
vim.keymap.set("n", "X", "<cmd>FloatermKill<cr>", { desc = "Toggle terminal", buffer = true })
vim.keymap.set("n", "<leader>n", "<cmd>FloatermNew<cr>", { desc = "Toggle terminal", buffer = true })
vim.keymap.set("n", "H", "<cmd>FloatermPrev<cr>", { desc = "Toggle terminal", buffer = true })
vim.keymap.set("n", "L", "<cmd>FloatermNext<cr>", { desc = "Toggle terminal", buffer = true })
