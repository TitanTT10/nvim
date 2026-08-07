return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.2.2',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		},
		config = function()
			local builtin = require('telescope.builtin')
			-- set keybinds
			vim.keymap.set('n', '<leader>?', builtin.keymaps, { desc = 'Telescope list normal mode keymappings' })
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
			vim.keymap.set('n', '<leader>man', builtin.man_pages, { desc = 'Telescope system manpages' })
			vim.keymap.set('n', '<leader>opt', builtin.vim_options, { desc = 'Telescope list and edit vim options' })

			vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Telescope LSP document symbols' })

			-- diagnostics keybinds
			vim.keymap.set('n', '<leader>dd', builtin.diagnostics,
				{ noremap = true, silent = true, desc = 'Telescope diagnostics' })
			-- Alternative without Telescope: vim.keymap.set('n', '<leader>dd', vim.diagnostic.setloclist, { desc = 'Set location list' })

			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require('telescope').load_extension('fzf')
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require('telescope').setup({
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown {}
					}
				}
			})
			require('telescope').load_extension('ui-select')
		end
	}
}
