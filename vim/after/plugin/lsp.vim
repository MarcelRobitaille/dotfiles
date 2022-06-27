nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
" LSP config (the mappings used in the default file don't quite work right)
" nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" inoremap <silent> (

lua <<EOF
vim.lsp.set_log_level("debug")
EOF
