return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd.colorscheme("tokyonight")
		vim.cmd("highlight Normal ctermbg=none guibg=none")

	end,
}
--"tokyonight" "tokyonight-night" "tokyonight-storm" "tokyonight-day" "tokyonight-moon"
