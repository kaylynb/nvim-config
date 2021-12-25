local M = {}

M.config = function()
	local cmp = require('cmp')
	local luasnip = require('luasnip')

	vim.opt.completeopt = 'menuone,noselect'

	-- local feed = function(key, mode)
	-- 	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode or 'n', true)
	-- end

	-- local has_words_before = function()
	-- 	if 'prompt' == vim.api.nvim_buf_get_option(0, 'buftype') then
	-- 		return false
	-- 	end

	-- 	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	-- 	return 0 ~= col and nil == vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
	-- end

	cmp.setup({
		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' }
		},

		formatting = {
			format = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = '[LSP]',
					buffer = '[Buffer]',
					luasnip = '[Snippet]',
				})[entry.source.name]

				return vim_item
			end
		},


		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},

		mapping = {
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<Tab>'] = cmp.mapping(function(fallback)
				-- if 1 == vim.fn.pumvisible() then
				-- 	feed('<C-n>')
				-- elseif 1 == luasnip.expand_or_jumpable() then
				if 1 == luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				-- elseif has_words_before() then
				-- 	cmp.complete()
				else
					fallback()
				end
			end, { 'i', 's'}),
			['<S-Tab>'] = cmp.mapping(function(fallback)
				-- if 1 == vim.fn.pumvisible() then
				-- 	feed('<C-p>')
				-- elseif luasnip.jumpable(-1) then
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { 'i', 's' }),
			-- ['<C-x><C-o>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<C-y>'] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
		}
	})

	local cmp_autopairs = require('nvim-autopairs.completion.cmp')

	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
		map_char = {
			all = "(",
			tex = "{",
		}
	}))

	require('nvim-autopairs').setup({
		check_ts = true,
	})
end

return M
