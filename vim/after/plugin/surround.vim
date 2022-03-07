function SetupSurround()

	if exists('g:debug_plugin_settings')
		echom 'Setting up Surround...'
	endif

	" Surround with parentheses with function name in front
	let g:surround_{char2nr('f')} = "\1function\1(\r)"

	" Surround with curly brackets with LaTeX macro in front
	let g:surround_{char2nr('l')} = "\\\1LaTeX macro\1{\r}"

	let g:surround_{char2nr('|')} = "|\r|"
	let g:surround_{char2nr('$')} = "$\r$"

	" Surround with italics / bold
	autocmd FileType tex let g:surround_{char2nr('i')} = "\\textit{\r}"
	autocmd FileType markdown let g:surround_{char2nr('i')} = "*\r*"
	autocmd FileType tex let g:surround_{char2nr('b')} = "\\textbf{\r}"
	autocmd FileType markdown let g:surround_{char2nr('b')} = "**\r**"


	let g:surround_{char2nr('q')} = "\\textquote{\r}"

endfunction

autocmd! User vim-surround call SetupSurround()

if exists('g:loaded_surround') && g:loaded_surround
	call SetupSurround()
endif
