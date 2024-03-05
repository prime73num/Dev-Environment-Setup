return {
  dir = "options",
  name = "AHUa.options",
  priority = 1500, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd([[
    language en_US.UTF-8
    set encoding=UTF-8
    ]])
    local opt = vim.opt -- for conciseness

    opt.relativenumber = true -- show relative line numbers
    opt.number = true -- shows absolute line number on cursor line (when relative number is on)
    opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
    opt.shiftwidth = 2 -- 2 spaces for indent width
    opt.expandtab = true -- expand tab to spaces
    opt.autoindent = true -- copy indent from current line when starting new one
    opt.wrap = false -- disable line wrapping
    opt.ignorecase = true -- ignore case when searching
    opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
    opt.cursorline = true -- highlight the current cursor line
    opt.termguicolors = true
    opt.signcolumn = "yes" -- show sign column so that text doesn't shift
    opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
    opt.splitright = true -- split vertical window to the right
    opt.splitbelow = true -- split horizontal window to the bottom
    opt.swapfile = false
    opt.laststatus = 3
    opt.scrolloff = 8
    opt.pumheight = 23
  end,
}
