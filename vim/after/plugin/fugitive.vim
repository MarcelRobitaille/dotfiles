function! SetupFugitive()

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

	let g:fugitive_gitlab_domains = ['https://gitlab.robitaille.host']
	let g:fugitive_gitlab_ssh_user = 'gitlab'

endfunction

autocmd! User vim-fugitive call SetupFugitive()

if g:loaded_fugitive
	call SetupFugitive()
endif
