
" Commentary
" ========================================

" ctrl-/ -- Insert current comment leader replacing %s
imap <C-_> <C-r>=substitute(&commentstring, '%s', '', '')<CR>


" CoC
" ========================================

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
