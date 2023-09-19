local M = {
	'ggandor/leap.nvim',
}

function M.config()
	require('leap').set_default_keymaps()
end

return M
