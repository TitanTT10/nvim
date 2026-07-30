return {
	'nvim-lualine/lualine.nvim',
	-- dependencies = { 'nvim-tree/nvim-web-devicons' }  -- needed for *fancy* icons etc.

	config = function()
		require('lualine').setup({
			options = {
				theme = 'dracula',
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { { 'filename', path = 3 } },
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {
				lualine_a = { { 'tabs', mode = 2, } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						'buffers',
						symbols = {
							modified = '[+]',
							alternate_file = '#',
							directory = ''
						}
					}
				}
			},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		})
	end,
}
