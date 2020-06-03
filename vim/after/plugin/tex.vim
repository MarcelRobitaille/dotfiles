function SetupTex()

	if exists('g:debug_plugin_settings')
		echom 'Setting up tex...'
	endif

	let g:tex_conceal = ''

	let g:tex_IgnoredWarnings =
		\ 'Underfull'."\n".
		\ 'You might wish'."\n"

endfunction

autocmd! User vimtex call SetupTex()

augroup marcel_tex_filetype
	" Replace all `plaintex` files with `tex` files
	autocmd FileType plaintex setlocal filetype=tex
augroup END

if exists(':Vimtex')
	call SetupTex()
endif
