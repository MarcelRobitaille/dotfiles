function! SetupUltiSnips()

	let g:UltiSnipsExpandTrigger = "<tab>"
	let g:UltiSnipsSnippetsDir = '~/.vim/snippets'

endfunction

autocmd! User ultisnips call SetupUltiSnips()

if exists(':UltiSnips')
	call SetupUltiSnips()
endif
