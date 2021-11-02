local M = {}

local vi_mode_utils = require('feline.providers.vi_mode')

M.mode_colors = {
	['NORMAL'] = 'green',
	['OP'] = 'green',
	['INSERT'] = 'blue',
	['VISUAL'] = 'orange',
	['LINES'] = 'orange',
	['BLOCK'] = 'orange',
	['REPLACE'] = 'red',
	['V-REPLACE'] = 'red',
	['ENTER'] = 'aqua',
	['MORE'] = 'aqua',
	['SELECT'] = 'orange',
	['COMMAND'] = 'green',
	['SHELL'] = 'green',
	['TERM'] = 'green',
	['NONE'] = 'yellow'
}

M.is_insert_mode = function()
	return 'INSERT' == vi_mode_utils.get_vim_mode()
end

M.get_mode_color = function()
	return M.mode_colors[vi_mode_utils.get_vim_mode()]
end

M.get_bg = function()
	return M.is_insert_mode() and 'fg0' or M.get_mode_color()
end

local get_hl_name = function(color)
	return 'mode' .. color
end

M.get_sep = function()
	return {
		str = ' ',
		hl = get_hl_name(M.get_bg()),
	}
end

local get_hl_gen = function(color_fn)
	return function()
		local color = color_fn()
		return {
			name = get_hl_name(color),
			style = 'bold',
			fg = 'bg0',
			bg = color,
		}
	end
end

M.get_hl = get_hl_gen(M.get_bg)
M.get_right_hl = get_hl_gen(M.get_mode_color)

return M
