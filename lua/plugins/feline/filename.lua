local M = {}

local feline_file = require('feline.providers.file')
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

local get_window_special = function()
	local winid = vim.api.nvim_get_current_win()
	local wininfo = vim.fn.getwininfo(winid)[1]

	if (1 == wininfo.quickfix) then
		return '[quickfix]'
	end

	if (1 == wininfo.loclist) then
		return '[loclist]'
	end

	return nil
end


M.file_info_with_special = function(component, opts)
	local special = get_window_special()

	if (special) then
		return special
	end

	return feline_file.file_info(component, opts)
end

return M
