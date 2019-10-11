function! SetupAle()
	let g:ale_sign_error = ''
	let g:ale_sign_warning = ''

	let g:ale_linters = {
	\ 'c': [
	\	 'gcc',
	\ ],
	\ 'cpp': [
	\	 'g++',
	\ ],
	\ 'jsx': [
	\	 'eslint',
	\ ],
	\	'tex': [
	\		'chktex',
	\	],
	\}

	let g:ale_fixers = {
	\ 'javascript': [
	\ 	'eslint',
	\ ],
	\ 'python': [
	\ 	'autopep8',
	\ ],
	\}

	let g:ale_c_parse_makefile = 1
	let g:ale_c_gcc_parse_makefile = 1

	let g:ale_python_pylint_options = '--rcfile=' . getcwd() . '/pylintrc'

endfunction

autocmd! User ale call SetupAle()

if g:loaded_ale
	call SetupAle()
endif
