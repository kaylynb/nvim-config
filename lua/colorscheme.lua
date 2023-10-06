local vscode = vim.g.vscode == 1

if not vscode then

	vim.opt.termguicolors = true
	vim.opt.background = 'dark'

	require("gruvbox").setup({
		italic = {
			strings = true,
		}
	})

	vim.cmd('colorscheme gruvbox')
end
