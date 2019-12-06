function! SetupAirline()

	if exists('g:debug_plugin_settings')
		echom 'Setting up airline...'
	endif

	" Use powerline fonts
	let g:airline_powerline_fonts = 1

	" Prefer square bars to fancy symbols
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif

	" Hide things that are broken with my fonts or that I don't like the look of
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.linenr = ''

	" Show tabline
	let g:airline#extensions#tabline#enabled = 1

	" Don't collapse filename
	" let g:airline#extensions#tabline#fnamecollapse = 0

	" Show buffer numbers in tabline
	let g:airline#extensions#tabline#buffer_nr_show = 1

	let g:airline#extensions#whitespace#mixed_indent_algo = 2

endfunction

autocmd! User vim-airline call SetupAirline()

if g:loaded_airline
	call SetupAirline()
endif
