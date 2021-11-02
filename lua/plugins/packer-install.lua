return function()
local packer_install_path = vim.fn.stdpath('data') ..
	'/site/pack/packer/start/packer.nvim'

	if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
		vim.api.nvim_command(
		'!git clone --depth 1 https://github.com/wbthomason/packer.nvim ' .. packer_install_path
		)

		return false
	end

	return true
end
