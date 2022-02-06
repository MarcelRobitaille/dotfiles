" This is the old config
" TODO:
function! SetupLSP()
lua << EOF
	-- local nvim_lsp = require('lspconfig')

	-- local on_attach = function(_, bufnr)
	--	 vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	--	 local method = 'textDocument/publishDiagnostics'

	-- local default_callback = vim.lsp.callbacks[method]
	-- vim.lsp.callbacks[method] = function(err, method, result, client_id)
	--	 default_callback(err, method, result, client_id)
	--	 if result and result.diagnostics then
	--		 for _, v in ipairs(result.diagnostics) do
	--			 v.uri = v.uri or result.uri
	--		 end
	--		 vim.lsp.util.set_qflist(result.diagnostics)
	--		 end
	--	 end

	--	 -- Mappings.
	--	 local opts = { noremap=true, silent=true }
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	--	 vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)

	--	 -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	--	 -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	-- end

	-- local servers = {'gopls', 'rust_analyzer', 'sumneko_lua', 'tsserver', 'vimls', 'pyls', 'jsonls'}
	--local servers = {'pylsp', 'tsserver'}
	---- local servers = {'pyright', 'tsserver'}
	--for _, lsp in ipairs(servers) do
	--	nvim_lsp[lsp].setup {
	--		on_attach = on_attach,
	--	}
	--end
	require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
	require'lspconfig'.pyls.setup{
		on_attach=require'completion'.on_attach,
		settings = {
			pyls = {
				plugins = {
					mccabe = { enabled = false }
				},
			},
		},
	}
	require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}

	local saga = require 'lspsaga'
	saga.init_lsp_saga({
		error_sign = '',
		warn_sign = '',
	})
EOF

	nnoremap ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
	nnoremap [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
endfunction

" lua << EOF
" -- require'lspconfig'.pyright.setup{}
" require'lspconfig'.cmake.setup{}
" require'lspconfig'.ccls.setup{}
" EOF
" lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
" lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
" lua require'lspconfig'.pylsp.setup{on_attach=require'completion'.on_attach}

" This is the new one
lua <<EOF

	-- Setup nvim-cmp.
	local cmp = require'cmp'

	cmp.setup({
		preselect = cmp.PreselectMode.None,
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		mapping = {
			['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			['<C-e>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- ['<CR>'] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'ultisnips' },
			{ name = 'path' },
		}, {
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline('/', {
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})

	-- Setup lspconfig.
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	-- require('lspconfig')['ccls'].setup {
	--	 capabilities = capabilities
	-- }
	require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }
EOF
