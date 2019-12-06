function! SetupUltiSnips()

	if exists('g:debug_plugin_settings')
		echom 'Setting up UltiSnips...'
	endif

	let g:UltiSnipsExpandTrigger = "<tab>"
	let g:UltiSnipsSnippetsDir = '~/.vim/snippets'

endfunction

autocmd! User ultisnips call SetupUltiSnips()

if exists(':UltiSnips')
	call SetupUltiSnips()
endif
