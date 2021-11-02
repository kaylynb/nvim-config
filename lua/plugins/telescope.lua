local M = {}

local t = function(cmd, opts)
	return
		[[<cmd> lua require('telescope.builtin').]] ..
		cmd ..
		[[(require('telescope.themes').get_ivy({]] ..
		(opts or '') ..
		[[}))<CR>]]
end

M.config = function()

	require('telescope').setup {
		defaults = {
			mappings = {
				i = {
					["<Esc>"] = require('telescope.actions').close
				}
			}
		}
	}

	require('which-key').register({
		['<C-p>'] = { t('find_files', 'hidden = true'), 'Find Files' },
		['<Leader>f'] = {
			name = 'Find',
			f = { t('live_grep'), 'Grep' },
			F = { t('grep_string'), 'Grep Cursor' },
			h = { t('help_tags'), 'Help' },
			b = { t('buffers'), 'Buffers' },
			B = { t('live_grep', 'grep_open_files = true'), 'Grep Buffers' },
		},
	})
end

M.action = t

return M
