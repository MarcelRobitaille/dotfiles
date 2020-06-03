function SetupTex()

	if exists('g:debug_plugin_settings')
		echom 'Setting up tex...'
	endif

	let g:tex_conceal = ''

	let g:tex_IgnoredWarnings =
		\ 'Underfull'."\n"
endfunction

autocmd! User vimtex call SetupTex()

if exists(':Vimtex')
	call SetupTex()
endif
