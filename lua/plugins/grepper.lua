local M = {}

M.config = function()
	vim.g.grepper = {tools = {'rg', 'git'}}

	require('which-key').register({
		['<Leader>'] = {
			g = { ':Grepper<CR>', 'Grep' },
			G = { ':Grepper -buffers<CR>', 'Grep Buffers' },
			['*'] = { ':Grepper -cword -noprompt<CR>', 'Grep Word' },
		},
	})
end

return M
