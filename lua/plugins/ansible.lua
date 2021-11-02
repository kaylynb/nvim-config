local M = {}

M.config = function()
	vim.g.ansible_unindent_after_newline = 1
	vim.g.ansible_name_highlight = 'd'

	vim.cmd([[
		function! IsAnsible()
			let filepath = expand("%:p")

			if filepath =~ '\v(/|\\)(tasks|roles|handlers|meta)(/|\\).*\.ya?ml$' | return 1 | endif
			if filepath =~ '\v(group|host)_vars(/|\\)' | return 1 | endif

			return 0
		endfunction

		autocmd! ansible_vim_fthosts
		autocmd! ansible_vim_ftjinja2
		augroup ansible
			autocmd!
			autocmd BufNewFile,BufRead * if IsAnsible() | set ft=yaml.ansible | endif
		augroup end
	]])
end

return M
