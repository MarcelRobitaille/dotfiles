
" Commentary
" ========================================

" ctrl-/ -- Insert current comment leader replacing %s
imap <C-_> <C-r>=substitute(&commentstring, '%s', '', '')<CR>
