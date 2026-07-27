vim.treesitter.language.register('lox', 'lox')
vim.treesitter.language.register('python', 'python')

local languages = { 'lox', 'python' }

vim.api.nvim_create_autocmd('FileType', {
	pattern = languages,
	callback = function(args)
		vim.treesitter.start(args.buf)
	end,
})
