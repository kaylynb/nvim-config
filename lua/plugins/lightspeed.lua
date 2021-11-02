local M = {}

M.config = function()
	local ignore_keys = { 's', 'S', 'f', 'F', 't', 'T' }

	local register_keys = {}
	for _, n in pairs(ignore_keys) do
		register_keys[n] = 'which_key_ignore'
	end

	require('which-key').register(register_keys)
end

return M
