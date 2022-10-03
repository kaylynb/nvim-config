if not require('plugins.packer-install')() then
	print('installed packer, restart')

	return
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'jamessan/vim-gnupg'

	-- editorconfig
	use 'editorconfig/editorconfig-vim'

	use {
		'folke/which-key.nvim',
		config = function() require('plugins.which-key').config() end
	}

	-- color scheme
	use {
		'ellisonleao/gruvbox.nvim',
		requires = 'rktjmp/lush.nvim'
	}

	-- enhanced f
	use {
		'ggandor/leap.nvim',
		config = function() require('plugins.leap').config() end
	}

	-- netrw replacement
	use {
		'justinmk/vim-dirvish',
		config = function() require('plugins.dirvish') end
	}

	-- fzf/ctrlp and others
	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('plugins.telescope').config() end
	}

	-- tree sitter
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = 'windwp/nvim-ts-autotag',
		config = function() require('plugins.treesitter').config() end
	}

	-- auto-omnifunc
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'windwp/nvim-autopairs'
		},
		config = function() require('plugins.cmp').config() end
	}

	-- lsp
	use {
		'neovim/nvim-lspconfig',
		config = function() require('plugins.lsp').config() end,
		cond = function() return not vim.g.nolsp end
	}

	-- use {
	-- 	'kyazdani42/nvim-tree.lua',
	-- 	config = function() require('plugins.nvim-tree').config() end,
	-- }

	use {
		'mhinz/vim-grepper',
		opt = true,
		cmd = { 'Grepper', '<plug>(GrepperOperator)' },
		setup = function() require('plugins.grepper').config() end,
	}

	-- git integration
	use {
		'tpope/vim-fugitive',
		config = function() require('plugins.fugitive').config() end,
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function() require('plugins.gitsigns').config() end,
	}

	-- statusline
	use {
		'feline-nvim/feline.nvim',
		config = function() require('plugins.feline').config() end,
		requires = 'ellisonleao/gruvbox.nvim',
		after = 'gruvbox.nvim',
	}

	-- line commenting
	use {
		'b3nj5m1n/kommentary',
		config = function() require('plugins.kommentary').config() end,
	}

	use 'tpope/vim-surround'

	-- file types
	use 'iloginow/vim-stylus'

	use 'ledger/vim-ledger'

	-- use 'matt-deacalion/vim-systemd-syntax'
	-- use {'kaylynb/vim-nftables', branch = 'noindentstyles'}
	-- use 'rafcamlet/nvim-luapad'

end)


