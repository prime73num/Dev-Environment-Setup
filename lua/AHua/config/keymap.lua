return {
  dir = "keymap",
  name = "AHUa.keymap",
  priority = 1500, -- make sure to load this before all the other start plugins
  config = function()
    local keymap = vim.keymap -- for conciseness
    local new_command = vim.api.nvim_create_user_command

    keymap.set("n", "<leader>i", "ciw", { desc = "Change in word" })
    keymap.set("n", "<leader>;", ":", { desc = "Command line" })
    keymap.set("n", "<leader>w", "<C-w>", { desc = "Window command prefix" })
    keymap.set("n", "<leader>q", "<C-w>c", { desc = "Close window" })
    keymap.set("n", "a", "$a", { desc = "Append at end of line" })
    keymap.set("n", "A", "ea", { desc = "Append after word" })
    keymap.set({"n", "v"}, "J", "3<C-e>3j", { desc = "Move up fast" })
    keymap.set({"n", "v"}, "K", "3<C-y>3k", { desc = "Move down fast" })
    keymap.set("n", "<leader>e", "<cmd>e #<cr>", { desc = "Go to last buffer" })
    keymap.set("n", "<cr>", "$", { desc = "Go to line end" })
    keymap.set("n", "U", "u", { desc = "Undo" })
    keymap.set("n", "u", "^", { desc = "Disable Undo" })
    keymap.set(
      "i",
      "<c-v>",
      "<c-r><c-p>*",
      { desc = "Paste from system clipboard" }
    )
    keymap.set(
      "n",
      "<leader>rr",
      "<cmd>noh<cr>",
      { desc = "Redraw the highlights" }
    )
    -- keymap.set("n", "p", "p=`]", { desc = "Paste and format" })
    keymap.set("n", ".", "^", { desc = "Disable redo" })

    vim.cmd([[
    nnoremap <silent> w :call search('\<\w', 'W', line("."))<cr>
    nnoremap <silent> e :call search('\w\>', 'W', line("."))<cr>
    nnoremap <silent> b :call search('\<\w', 'bW', line("."))<cr>
    nnoremap <silent> gE :call search('\w\>', 'bW', line("."))<cr>
    ]])

    local util = require("AHua.util")
    -- Source _test.lua to test lua function
    new_command("AHuaTest", function()
      vim.cmd("source $HOME/.config/nvim/lua/AHua/_test.lua")
    end, {})

    -- Copy from vim register to sys clipboard
    new_command("CopyToSys", function()
      vim.cmd([[
      let @* = @0
    ]])
    end, {})

    new_command("Openfinder", function()
      util.open_finder()
    end, {})

    new_command("GetPath", function()
      vim.cmd([[
      echo expand("%")
      let @* = expand("%")
    ]])
    end, {})
  end,
}
