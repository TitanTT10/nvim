vim.treesitter.language.register('lox', 'lox')

local languages = { 'lox' }

vim.api.nvim_create_autocmd('FileType', {
	pattern = languages,
	callback = function(args)
		vim.treesitter.start(args.buf)
	end,
})
