
-- Vibecoded by GPT-5.6 Luna
vim.api.nvim_create_user_command("Hex", function()
	local source_buf = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(source_buf, 0, -1, false)
	local input = table.concat(lines, "\n")

	-- Preserve the usual buffer newline behavior.
	if #lines > 0 then
		input = input .. "\n"
	end

	local output = vim.fn.system({ "xxd", "-g", "1" }, input)

	if vim.v.shell_error ~= 0 then
		vim.notify("xxd failed: " .. output, vim.log.levels.ERROR)
		return
	end

	local hex_lines = vim.split(output, "\n", { plain = true })
	if hex_lines[#hex_lines] == "" then
		table.remove(hex_lines)
	end

	local hex_buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(hex_buf, 0, -1, false, hex_lines)

	vim.api.nvim_set_option_value("buftype", "nofile", { buf = hex_buf })
	vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = hex_buf })
	vim.api.nvim_set_option_value("swapfile", false, { buf = hex_buf })
	vim.api.nvim_set_option_value("modifiable", false, { buf = hex_buf })
	vim.api.nvim_buf_set_name(hex_buf, "[hex]")

	vim.cmd("topleft new")
	vim.api.nvim_win_set_buf(0, hex_buf)
end, {
	desc = "Open xxd hex dump of the current buffer",
})
