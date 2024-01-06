return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local comment = require("Comment")
    comment.setup({
    toggler = {
        line = 'cl',
        block = 'cb',
    },
    opleader = {
        line = 'cl',
        block = 'cb',
    },
    mappings = {
        basic = true,
        extra = false,
    },
    })
  end,
}
