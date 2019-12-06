function SetupSurround()

	if exists('g:debug_plugin_settings')
		echom 'Setting up Surround...'
	endif

	" Surround with parentheses with function name in front
	let g:surround_{char2nr('f')} = "\1function\1(\r)"

	" Surround with curly brackets with LaTeX macro in front
	let g:surround_{char2nr('l')} = "\\\1LaTeX macro\1{\r}"

	" Surround with italics
	let g:surround_{char2nr('i')} = "\\textit{\r}"

endfunction

autocmd! User vim-surround call SetupSurround()

if g:loaded_surround
	call SetupNERDTree()
endif
