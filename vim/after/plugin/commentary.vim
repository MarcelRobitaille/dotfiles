function! SetupCommentary()

	if exists('g:debug_plugin_settings')
		echom 'Setting up commentary...'
	endif

	autocmd FileType vb setlocal commentstring=\'\ %s
	autocmd FileType vim setlocal commentstring=\"\ %s
	autocmd FileType zsh setlocal commentstring=#\ %s
	autocmd FileType cpp setlocal commentstring=\/\/\ %s
	autocmd FileType matlab setlocal commentstring=%\ %s
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd FileType dosbatch setlocal commentstring=rem\ %s
	autocmd FileType crontab setlocal commentstring=#\ %s

	" Mappings
	" ========================================

	" ctrl-/ -- Insert current comment leader replacing %s
	imap <C-_> <C-r>=substitute(&commentstring, '%s', '', '')<CR>

	" ctrl-/ -- Comment selection
	vmap <C-_> <Plug>Commentary

endfunction

autocmd! user vim-commentary call SetupCommentary()

if exists('g:loaded_commentary') && g:loaded_commentary
	call SetupCommentary()
endif
