local M = {}

M.config = function()
	vim.g.kommentary_create_default_mappings = false

	require('kommentary.config').configure_language('default', {
		prefer_single_line_comments = true,
		use_consistent_indentation = true,
		ignore_whitespace = true,
	})

	local wk = require('which-key')
	wk.register({
		gcc = { '<Plug>kommentary_line_default', 'Comment Line' },
		gc = { '<Plug>kommentary_motion_default', 'Comment Line' },
	})

	wk.register({
		gc = { '<Plug>kommentary_visual_default<C-c>', 'Comment Selection' },
	}, { mode = 'v', })

end

return M
