-- set <leader> variable
vim.g.mapleader = " "


-- ### visual ###
-- turn off line wrapping
vim.opt.wrap = false

-- turn off ruler
vim.opt.ruler = false

-- turn on line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- config to show whitespace
vim.opt.list = true
vim.opt.listchars = {
	space = "·", nbsp = "␣", trail = "•", tab = "▸ ",
	extends = "❯", precedes = "❮",
	eol = "↲", -- "↩"
}

-- ### indentation ###
-- set std indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Set indentation for Lua files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.expandtab = false
	end,
})

-- ### fileformat / line endings ###
-- Set Unix line endings ('\n' instead of '\r\n')
vim.opt.fileformat = "unix"

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = "*",
	command = "setlocal fileformat=unix",
})


-- ### netrw settings ###
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
-- vim.g.netrw_browse_split = 2
