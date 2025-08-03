-- set <leader> variable
vim.g.mapleader = " "

-- turn off line wrapping
vim.opt.wrap = false

-- use 4 spaces instead of tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- turn off ruler
vim.opt.ruler = false

-- turn on line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- config to show whitespace
vim.opt.list = true
vim.opt.listchars = { space = "·", trail = "•", tab = "~~", extends = ">", precedes = "<" }
