local M = {}

M.config = function()
	require('gitsigns').setup({
		keymaps = {},
	})

	local wk = require('which-key')
	wk.register({
		['<Leader>h'] = {
			name = 'gitsigns',
			s = { [[<cmd>lua require('gitsigns').stage_hunk()<CR>]], 'Stage Hunk' },
			S = { [[<cmd>lua require('gitsigns').stage_buffer()<CR>]], 'Stage Buffer' },
			u = { [[<cmd>lua require('gitsigns').undo_stage_hunk()<CR>]], 'Undo Stage Hunk' },
			r = { [[<cmd>lua require('gitsigns').reset_hunk()<CR>]], 'Reset Hunk' },
			b = { [[<cmd>lua require('gitsigns').blame_line(true)<CR>]], 'Blame Line' },
		},
	})

	-- TODO: neogit maybe?
-- 	wk.register({
-- 		['<Leader>h'] = {
-- 			name = 'gitsigns',
-- 			s = { [[<cmd>lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>]], 'Stage Hunk' },
-- 			r = { [[<cmd>lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>]], 'Reset Hunk' },
-- 		},
-- 	}, { mode = 'v', })
end

return M
