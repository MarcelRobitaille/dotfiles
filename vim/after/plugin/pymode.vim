function! SetupPymode()
	if ! exists(':PymodeVersion')
		return
	endif

	let g:pymode_options_colorcolumn = 0
endfunction

augroup marcel_pymode_filetype
	autocmd BufEnter *.py call SetupPymode()
augroup END

let g:pymode_options_colorcolumn = 0
