-- Enable inlay hints globally
vim.lsp.inlay_hint.enable(true)

-- Diagnostic configuration
local severity = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_text = {
		source = "always", -- Or "if_many"
		prefix = "◆", -- Could be ■, ▎, x, ●, ▶, ◆, ✕
	},
	severity_sort = true,
	float = {
		source = "if_many", -- Or "always"
	},
	signs = {
		text = {
			[severity.ERROR] = "󰅚",
			[severity.WARN] = "󰀪",
			[severity.HINT] = "󰋽",
			[severity.INFO] = "󰌶",
		},
	},
})

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>",
	{ noremap = true, silent = true, desc = "Telescope diagnostics" })
-- Alternative without Telescope: vim.keymap.set("n", "<leader>dd", vim.diagnostic.setloclist, { desc = "Set location list" })

-- LSP keymaps
vim.keymap.set("n", "<leader>uh", function()
	local current_state = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
	vim.lsp.inlay_hint.enable(not current_state, { bufnr = 0 })
	vim.notify(current_state and "Inlay Hints Disabled" or "Inlay Hints Enabled",
		current_state and vim.log.levels.WARN or vim.log.levels.INFO)
end, { desc = "Toggle Inlay Hints" })
vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format" })
