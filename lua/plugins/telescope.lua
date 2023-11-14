local M = {
	'nvim-telescope/telescope.nvim',
	cond = vim.g.vscode ~= 1,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
}

function M.config()
	require('telescope').setup {
		pickers = {
			find_files = {
				theme = 'ivy',
			},
			live_grep = {
				theme = 'ivy',
			},
			grep_string = {
				theme = 'ivy',
			},
			help_tags = {
				theme = 'ivy',
			},
			buffers = {
				theme = 'ivy',
			},
		}
	}

	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<C-p>', builtin.find_files, {})
	vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fF', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fB', function() builtin.live_grep({
		grep_open_files = true,
	}) end)
end

return M
