local function set_keymaps(mode, keys, opts)
	for lh, rh in pairs(keys) do
		vim.api.nvim_set_keymap(mode, lh, rh, opts or { silent = true, noremap = true })
	end
end

-- normal mode
set_keymaps('n', {
	-- window navigation
	['<C-h>'] = '<C-w>h',
	['<C-j>'] = '<C-w>j',
	['<C-k>'] = '<C-w>k',
	['<C-l>'] = '<C-w>l',

	-- move line
	['<A-j>'] = ':m .+1<CR>==',
	['<A-k>'] = ':m .-2<CR>==',
})

-- visual mode
set_keymaps('v', {
	-- move lines
	['<A-j>'] = [[:m '>+1<CR>gv=gv]],
	['<A-k>'] = [[:m '<-2<CR>gv=gv]],

	-- remain in visual mode when indenting
	['>'] = '>gv',
	['<'] = '<gv',
})

-- insert mode
-- Navigate tab completion
vim.api.nvim_set_keymap('i', '<C-j>', [[pumvisible() ? "\<down>" : "\<C-j>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', [[pumvisible() ? "\<up>" : "\<C-k>"]], { expr = true, noremap = true })
