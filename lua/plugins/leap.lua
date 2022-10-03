local M = {}

M.config = function()
	local ignore_keys = { 's', 'S' }

	local register_keys = {}
	for _, n in pairs(ignore_keys) do
		register_keys[n] = 'which_key_ignore'
	end

	require('which-key').register(register_keys)

	require('leap').set_default_keymaps()

	vim.api.nvim_create_autocmd('User', {
		pattern = 'LeapEnter',
		callback = function ()
			vim.opt.conceallevel = 0
		end,
	})

	vim.api.nvim_create_autocmd('User', {
		pattern = 'LeapExit',
		callback = function ()
			vim.opt.conceallevel = 2
		end,
	 })
end

return M
