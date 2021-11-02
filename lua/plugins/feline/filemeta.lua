local M = {}

M.file_encoding = function(winid)
	local bufnr = vim.api.nvim_win_get_buf(winid)

	return (vim.bo[bufnr].fenc ~= '' and vim.bo[bufnr].fenc) or vim.o.enc
end

M.file_type = function(winid)
	return vim.bo[vim.api.nvim_win_get_buf(winid)].filetype
end

M.file_format = function(winid)
	return vim.bo[vim.api.nvim_win_get_buf(winid)].fileformat
end

return M
