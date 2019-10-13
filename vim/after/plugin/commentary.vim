function! SetupCommentary()

	autocmd FileType vb setlocal commentstring=\'\ %s
	autocmd FileType vim setlocal commentstring=\"\ %s
	autocmd FileType zsh setlocal commentstring=#\ %s
	autocmd FileType cpp setlocal commentstring=\/\/\ %s
	autocmd FileType matlab setlocal commentstring=%\ %s
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd FileType dosbatch setlocal commentstring=rem\ %s
endfunction

autocmd! user vim-commentary call SetupCommentary()

if g:loaded_commentary
	call SetupCommentary()
endif
