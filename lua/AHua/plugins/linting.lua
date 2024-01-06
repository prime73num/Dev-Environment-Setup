return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    local util = require("AHua.util")
    local c = require("AHua.color")
    local hl_telescope = {
      ["DiagnosticError"] = { guifg = c.red,   guibg = "NONE" },
      ["DiagnosticWarn"]  = { guifg = c.orange_dark, guibg = 'NONE', },
      ["DiagnosticInfo"]  = { guifg = c.blue_dark, guibg = 'NONE', },
      ["DiagnosticHint"]  = { guifg = c.grey_dark, guibg = 'NONE', },
    }
    util.highlight(hl_telescope)

  end,
}

