if exists('g:loaded_lspsaga') && g:loaded_lspsaga
lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
saga.init_lsp_saga({
	error_sign = '',
	warn_sign = '',
})
vim.cmd "autocmd CursorHoldI * silent! Lspsaga signature_help"
EOF

" nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>

" Jump to diagnostic
nnoremap <silent> ]d :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> [d :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>

set updatetime=500
endif
