local ascii_art = require "AHua.ascii_art"
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = ascii_art.dos_rebel

    dashboard.section.footer.val = os.date("%Y-%m-%d", os.time())
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", " > New File", "<cmd>ene<CR>"),
      dashboard.button("i", " > Toggle File Explorer", "<cmd>Neotree<CR>"),
      dashboard.button("f", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("h", "@ > Find History File", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("o", "^ > Open Finder in CWD?", "<cmd>Openfinder<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
