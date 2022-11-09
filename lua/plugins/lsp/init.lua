local M = {}

local t = require('plugins.telescope').action
local wk = require('which-key')

local on_attach = function(client, bufnr)
	if client.resolved_capabilities.document_highlight then
		vim.cmd(
		[[
			" bg2
			hi LspReferenceRead  cterm=bold ctermbg=red guibg=#504945
			hi LspReferenceText  cterm=bold ctermbg=red guibg=#504945
			hi LspReferenceWrite cterm=bold ctermbg=red guibg=#504945
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup end
		]])
	end
	wk.register({
		['<A-CR>'] = { t('lsp_code_actions'), 'Code Action' },
		['<Leader>l'] = {
			a = { t('lsp_code_actions'), 'Code Action' },
			d = { t('lsp_document_diagnostics'), 'Document Diagnostics' },
			s = { t('lsp_document_symbols'), 'Document Symbols' },
			f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format' },
			q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'Loclist Diagnostics' },
			r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
		},
		g = {
			d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to Definition' },
			D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to Declaration' },
			i = { '<cmd>lua vim.lsp.buf.imtplementation()<CR>', 'Go to Implementation' },
			r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Go to References' },
			t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Go to Type Definition' },
			s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
			l = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'Line Diagnostics' },
		},
		K = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Show Hover' },
		[']d'] = { '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Next diagnostic' },
		['[d'] = { '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Previous Diagnostic' },
	}, { buffer = bufnr })

end

M.config = function()
	-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	-- 	close_events = {}
	-- })
	-- vim.lsp.set_log_level('debug')

	local lspconfig = require('lspconfig')

	wk.register({
		['<Leader>l'] = {
			name = 'LSP',
			w = { t('lsp_workspace_diagnostics'), 'Workspace Diagnostics' },
			S = { t('lsp_dynamic_workspace_symbols'), 'Workspace Symbols' },
		}
	})

	local servers = { 'tsserver' }

	for _, server in ipairs(servers) do
		lspconfig[server].setup {
			on_attach = on_attach,
			capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}
	end
end

return M
