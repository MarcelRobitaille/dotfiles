function SetupTex()

	if exists('g:debug_plugin_settings')
		echom 'Setting up tex...'
	endif

	" Exit early if vimtex not loaded
	if ! exists(':Vimtex')
		echom 'Warning: Vimtex not loaded. Exiting.'
		return
	endif

	let g:tex_conceal = ''

	let g:tex_IgnoredWarnings =
		\ 'Underfull'."\n".
		\ 'You might wish'."\n"

	let g:vimtex_quickfix_latexlog = {
		\ 'underfull' : 0,
		\}

	let g:vimtex_compiler_latexmk = {
	 \	'options': [
	 \		'-xelatex -shell-escape',
	 \	],
	 \ }

endfunction

augroup marcel_tex_filetype

	" Replace all `plaintex` files with `tex` files
	autocmd FileType plaintex setlocal filetype=tex

	" Call setup when opening `.tex` file
	autocmd BufEnter *.tex call SetupTex()
augroup END
