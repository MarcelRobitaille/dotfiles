function! SetupFugitive()

	if exists('g:debug_plugin_settings')
		echom 'Setting up fugitive...'
	endif

	" Delete fugitive buffers after close
	augroup fugitive_close
		autocmd BufReadPost fugitive://* set bufhidden=delete
	augroup END

	" Try to set git preview height properly
	set previewheight=12
	augroup previewheight
		autocmd BufEnter ?* call PreviewHeightWorkAround()
		function! PreviewHeightWorkAround()
			if &previewwindow
				exec 'setlocal winheight='.&previewheight
				exec 'resize '.&previewheight
			endif
		endfunction
	augroup END

	let g:fugitive_gitlab_domains = ['https://gitlab.robitaille.host', 'https://git.uwaterloo.ca']
	let g:fugitive_gitlab_ssh_user = 'gitlab'

	" Mappings
	" ========================================

	" <leader>s -- Git status
	nnoremap <leader>s :Git<CR>

	" <leader>c -- Git commit
	nnoremap <leader>c :Gcommit<CR>

	" <leader>df -- Git diff (mnemonic: git [d]i[f]f)
	nnoremap <leader>df :Gdiff<CR>
endfunction

autocmd! User vim-fugitive call SetupFugitive()

if exists('g:loaded_fugitive') && g:loaded_fugitive
	call SetupFugitive()
endif
