lua <<EOF
	local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	require'lspconfig'.texlab.setup { capabilities = capabilities }
	require'lspconfig'.rust_analyzer.setup { capabilities = capabilities }

-- TODO: Decide what LSP I want
-- Wait until I actually have a typscript project or so
--	require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
--	require'lspconfig'.pyls.setup{
--		on_attach=require'completion'.on_attach,
--		settings = {
--			pyls = {
--				plugins = {
--					mccabe = { enabled = false }
--				},
--			},
--		},
--	}
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.cmake.setup{}
-- require'lspconfig'.ccls.setup{}
-- lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
-- lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
-- lua require'lspconfig'.pylsp.setup{on_attach=require'completion'.on_attach}
EOF
