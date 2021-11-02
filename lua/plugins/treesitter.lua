local M = {}

M.config = function()
	require('nvim-treesitter.configs').setup {
		ensure_installed = {
			'bash',
			'c',
			'c_sharp',
			'cmake',
			'comment',
			'cpp',
			'css',
			'html',
			'javascript',
			'json',
			'jsonc',
			'lua',
			'python',
			'scss',
			'regex',
			'toml',
			'tsx',
			'typescript',
			'yaml',
			'zig',
		},
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		}
	}
end

return M
