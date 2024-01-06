return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    'kepano/flexoki-neovim',
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          n = {
            ["q"] = actions.close
          },
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("harpoon")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>so", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>sl", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>sj", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>sk", "<cmd>Telescope builtin<cr>", { desc = "Telescope builtin" })

    local util = require("AHua.util")
    local c = require("AHua.color")
    local hl_telescope = {
      ["TelescopePreviewTitle"] = { guifg = c.black,   guibg = c.blue_light },
      ["TelescopeMatching"]  = { guifg = c.orange_dark, guibg = 'NONE', gui = "bold", },
    }
    util.highlight(hl_telescope)
  end,
}
