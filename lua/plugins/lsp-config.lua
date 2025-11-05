return {
	{
		"mason-org/mason.nvim",
		config = function()
		require("mason").setup()
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		}
	},
	{
		"neovim/nvim-lspconfig",
		config = function()

		-- local lspconfig = require("lspconfig") -- got msg that this will be deprecated
		-- Rust-specific LSP configuration
		vim.lsp.config("rust_analyzer", {
			settings = {
				['rust-analyzer'] = {
					-- Enable inlay hints
					inlayHints = {
						enable = true,
						-- Customize specific types of hints
						parameterHints = { enable = true },
						typeHints = { enable = true },
						chainingHints = { enable = true },
						lifetimeElisionHints = { enable = true, useParameterNames = true },
					},
					-- Additional Rust analyzer configurations can go here
					diagnostics = {
						enable = true,
						experimental = { enable = true }
					}
				}
			},
			-- Optional: Add keymaps specific to Rust
			on_attach = function(client, bufnr)
				-- Inlay hints toggle
				vim.keymap.set('n', '<leader>uh', function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({bufnr = bufnr}), {bufnr = bufnr})
				end, { buffer = bufnr, desc = 'Toggle Inlay Hints' })
			end
		})

			vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end
	}
}
