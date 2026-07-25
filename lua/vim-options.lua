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
	space = "·",
	nbsp = "␣",
	trail = "•",
	tab = "▸ ",
	extends = "»",
	precedes = "«",
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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*",
	command = "setlocal fileformat=unix",
})

-- ### netrw settings ###
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
-- vim.g.netrw_browse_split = 2

-- ### custom keybinds ###
-- Tab keybinds
vim.keymap.set('n', '<Leader>tt', ':tabnew<CR>', { noremap = true, silent = true, desc = "New tab" })
vim.keymap.set('n', '<Leader>tn', 'gt', { noremap = true, silent = true, desc = "Next tab" })
vim.keymap.set('n', '<Leader>tp', 'gT', { noremap = true, silent = true, desc = "Previous tab" })
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>', { noremap = true, silent = true, desc = "Close current tab" })

-- Go to tab x (1-9 and 0)
for i = 1, 9 do
	vim.keymap.set('n', '<Leader>t' .. i, function()
		vim.cmd('tabn ' .. i) -- jump to tab number i
	end, { noremap = true, silent = true, desc = 'Go to tab ' .. i })
end

-- Buffer keybinds
vim.keymap.set('n', '<Leader>bb', ':enew<CR>', { noremap = true, silent = true, desc = "New buffer" })
vim.keymap.set('n', '<Leader>bn', ':bn<CR>', { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set('n', '<Leader>bp', ':bp<CR>', { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set('n', '<Leader>bc', ':bdelete<CR>', { noremap = true, silent = true, desc = "Discard current buffer" })
