local M = {}

M.line_percentage = function(winid)
	local current_line = vim.api.nvim_win_get_cursor(winid)[1]
	local lines = vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(winid))

	return string.format('%3d%%%%', math.floor(current_line / lines * 100))
end

M.position = function(winid)
	local row, col = unpack(vim.api.nvim_win_get_cursor(winid))
	return string.format('%3d:%-2d', row, col + 1)
end

return M
