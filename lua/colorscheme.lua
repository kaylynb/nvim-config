vim.opt.termguicolors = true
vim.opt.background = 'dark'

local c = require('gruvbox.palette')

require("gruvbox").setup({
	italic = true,
	overrides = {
		SignColumn = { bg = c.dark0  },
	},
})

vim.cmd('colorscheme gruvbox')
