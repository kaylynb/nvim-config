local M = {}

local mode = require('plugins.feline.mode')

local get_bg = function()
	return mode.is_insert_mode() and 'blue' or 'bg3'
end

local get_hl_name = function(bg)
	return 'filename' .. bg
end

M.get_hl = function()
	local bg = get_bg()
	return {
		name = get_hl_name(bg),
		fg = 'fg1',
		bg = bg,
	}
end

return M
