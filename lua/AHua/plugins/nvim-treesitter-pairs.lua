return {
  {
    "theHamsta/nvim-treesitter-pairs",
    dependencies = { "theHamsta/nvim-treesitter-pairs" },
    config = function()
      require("nvim-treesitter.configs").setup({
        pairs = {
          enable = true,
          disable = {},
          highlight_pair_events = { "CursorMoved" }, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
          highlight_self = true, -- whether to highlight also the part of the pair under cursor (or only the partner)
          goto_right_end = true, -- whether to go to the end of the right partner or the beginning
          fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
          keymaps = {
            goto_partner = "u",
            delete_balanced = "du",
          },
          delete_balanced = {
            only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
            fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
            longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
            -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
          },
        },
      })
    end,
  },
}
