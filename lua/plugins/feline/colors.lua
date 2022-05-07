local M = {}

-- local function fromhl(hl)
--   local result = {}
--   local list = vim.api.nvim_get_hl_by_name(hl, true)
--   for k, v in pairs(list) do
-- 		if k == 'background' or k == 'foreground' then
-- 			local name = k == "background" and "bg" or "fg"
-- 			result[name] = string.format("#%06x", v)
-- 		end
--   end
--   return result
-- end

local c = require('gruvbox.colors')
M.colors = {
	bg = c.dark0_soft,
	bg0_h = c.dark0_hard,
	bg0_s = c.dark0_soft,
	bg0 = c.dark0,
	bg1 = c.dark1,
	bg2 = c.dark2,
	bg3 = c.dark3,
	bg4 = c.dark4,
	fg0 = c.light0,
	fg1 = c.light1,
	fg2 = c.light2,
	fg3 = c.light3,
	fg4 = c.light4,
	green = c.bright_green,
	blue = c.neutral_blue,
	orange = c.bright_orange,
	red = c.bright_red,
	yellow = c.bright_yellow,
	aqua = c.bright_aqua
}

return M
