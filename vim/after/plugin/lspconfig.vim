if exists('g:lspconfig') && g:lspconfig
lua <<EOF

function string:starts_with(substr)
	return self:sub(1, string.len(substr)) == substr
end

function dump(o)
	if type(o) == 'table' then
			local s = '{ '
			for k,v in pairs(o) do
				 if type(k) ~= 'number' then k = '"'..k..'"' end
				 s = s .. '['..k..'] = ' .. dump(v) .. ','
			end
			return s .. '} '
	else
			return tostring(o)
	end
end


function filter_diagnostics_pyright(diagnostic)
	-- Allow kwargs to be unused, sometimes you want many functions to take the
	-- same arguments but you don't use all the arguments in all the functions,
	-- so kwargs is used to suck up all the extras
	if diagnostic.message == '"args" is not accessed' or
			diagnostic.message == '"kwargs" is not accessed' then
		return false
	end

	-- Allow variables starting with an underscore
	if string.match(diagnostic.message, '"_.+" is not accessed') then
		return false
	end

	return true
end

function filter_diagnostics_texlab(diagnostic)
	if diagnostic.message:starts_with('Underfull') then
		return false
	end

	if diagnostic.message:starts_with('Overfull') then
		return false
	end

	return true
end

function filter_diagnostics(diagnostic)
	if diagnostic.source == "Pyright" then
		return filter_diagnostics_pyright(diagnostic)
	end

	if diagnostic.source == "latex" then
		return filter_diagnostics_texlab(diagnostic)
	end

	return true
end

function custom_on_publish_diagnostics(a, params, client_id, c, config)
	params.diagnostics = vim.tbl_filter(filter_diagnostics, params.diagnostics)
	vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	custom_on_publish_diagnostics, {})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.texlab.setup { capabilities = capabilities }
require'lspconfig'.rust_analyzer.setup { capabilities = capabilities }
require'lspconfig'.phpactor.setup{ capabilities = capabilities }
require'lspconfig'.pyright.setup{ capabilities = capabilities }
-- require'lspconfig'.pylsp.setup {
-- 	capabilities = capabilities,
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				pylint = {
-- 					enabled = true
-- 				},
-- 				configurationSources = { "pycodestyle", "rope", "asdlfjaldfjl" }
-- 			}
-- 		}
-- 	}
-- }
-- require'lspconfig'.pylsp.setup { on_attach=require'completion'.on_attach}

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
EOF
endif
