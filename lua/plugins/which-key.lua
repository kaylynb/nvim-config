local M = {}

local which_key = require('which-key')

M.config = function()
	which_key.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
	})
end

return M
