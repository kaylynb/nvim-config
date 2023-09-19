local M = {
	'justinmk/vim-dirvish',
	cond = vim.g.vscode ~= 1,
}

function M.config()
	vim.g.loaded_netrwPlugin = 1
end

return M
