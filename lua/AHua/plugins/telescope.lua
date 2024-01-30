CWD = ""

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")
    local util = require("AHua.util")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          n = {
            ["q"] = actions.close,
            ["o"] = actions.select_default,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
          },
        },
      },
      pickers = {
        live_grep = {
          mappings = {
            n = {
              ["u"] = function(prompt_bufnr)
                CWD = util.get_parent_dir(CWD)
                local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                local opts = {
                  initial_mode = "normal",
                  default_text = current_picker:_get_prompt(),
                  cwd = CWD,
                  prompt_prefix = CWD .. " > ",
                }
                actions.close(prompt_bufnr)
                builtin.live_grep(opts)
              end,
            },
          },
        },
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>sj", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>sk", "<cmd>Telescope builtin<cr>", { desc = "Telescope builtin" })
    keymap.set("n", "<leader>so", function()
      builtin.oldfiles({
        initial_mode = "normal",
      })
    end, { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>sb", function()
      builtin.buffers({
        initial_mode = "normal",
      })
    end, { desc = "Telescope buffers" })

    keymap.set("n", "<leader>sp", function()
      local proj = require("AHua.projects")
      local opt = require("telescope.themes").get_dropdown({
        initial_mode = "normal",
      })
      proj(opt)
    end, { desc = "Telescope bookmark" })

    keymap.set("n", "<leader>sl", function()
      CWD = vim.fn.expand("%")
      builtin.live_grep({
        cwd = util.get_parent_dir(CWD),
        search_dirs = {vim.fn.expand"%:t"},
        prompt_prefix = CWD .. " > ",
      })
    end, { desc = "Find string in cwd" })
  end,
}
