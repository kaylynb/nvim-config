local M = {
	'nvim-lualine/lualine.nvim',
	cond = vim.g.vscode ~= 1,
}

function M.config()
	require('lualine').setup({
		options = {
			theme = 'gruvbox',
			section_separators = '',
			component_separators = '',
		}
	})
end

return M
