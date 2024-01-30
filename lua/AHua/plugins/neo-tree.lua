return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup({
        close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        use_default_mappings = false,
        window = {
          mappings = {
            ["<2-LeftMouse>"] = "open",
            ["o"] = "open",
            ["<esc>"] = "cancel", -- close preview or floating neo-tree window
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["a"] = {
              "add",
              config = {
                show_path = "none", -- "none", "relative", "absolute"
              },
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          },
        },
        filesystem = {
          filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            always_show = { -- remains visible even if other settings would normally hide it
              ".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              ".DS_Store",
              "thumbs.db",
            },
          },
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
          },
          hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
          window = {
            mappings = {
              ["u"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
              ["?"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "?" } },
              ["<leader>s"] = "telescope_find",
            },
          },
          commands = {
            telescope_find = function(state)
              local node = state.tree:get_node()
              local path
              if node and node.type == "directory" then
                path = node:get_id()
              else
                path = node:get_parent_id()
              end
              print(path)
              local tele_builtin = require("telescope.builtin")
              tele_builtin.live_grep({
                cwd = path,
              })
            end,
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
          },
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["u"] = "navigate_up",
              ["."] = "set_root",
            },
          },
        },
        git_status = {
          window = {
            mappings = {
              ["A"] = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            },
          },
        },
      })

      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>t", "<cmd>Neotree filesystem reveal left<cr>", { desc = "Open file tree" })
      keymap.set("n", "<leader>lb", "<cmd>Neotree buffers reveal float toggle<cr>", { desc = "Open buffer" })
      keymap.set("n", "<leader>lg", "<cmd>Neotree git_status reveal float toggle<cr>", { desc = "Open git status" })
    end,
  },
}
