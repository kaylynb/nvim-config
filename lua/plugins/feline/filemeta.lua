local M = {}

M.file_encoding = function()
	local bufnr = vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())

	return (vim.bo[bufnr].fenc ~= '' and vim.bo[bufnr].fenc) or vim.o.enc
end

M.file_type = function()
	return vim.bo[vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())].filetype
end

M.file_format = function()
	return vim.bo[vim.api.nvim_win_get_buf(vim.api.nvim_get_current_win())].fileformat
end

return M
