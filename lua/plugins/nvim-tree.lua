local M = {}

M.config = function()
	local tree_config = {
		follow = 1,
		lsp_diagnostics = 1,
		update_cwd = 1,
		respect_buf_cwd = 1,
		root_folder_modifier = ':t',
		disable_netrw = 1,
		hijack_netrw = 1,
	}

	for opt, val in pairs(tree_config) do
		vim.g['nvim_tree_' .. opt] = val
	end

	require('which-key').register({
		['<Leader>e'] = { '<cmd>NvimTreeToggle<CR>', 'Tree Toggle' },
		['-'] = { '<cmd>NvimTreeToggle<CR>', 'Tree Open' },
	})

end

return M
