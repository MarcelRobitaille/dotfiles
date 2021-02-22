function! SetupAle()

	if exists('g:debug_plugin_settings')
		echom 'Setting up ale...'
	endif

	let g:ale_completion_enabled = 0
	let g:ale_disable_lsp = 1

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
	\ 'python': [
	\		'pylint', 'flake8',
	\ ],
	\ 'markdown': [],
	\}

	let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'javascript': ['eslint'],
	\ 'python': ['autopep8', 'isort', 'trim_whitespace'],
	\ 'rust': ['rustfmt'],
	\}

	let g:ale_c_parse_makefile = 1
	let g:ale_c_gcc_parse_makefile = 1

	let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

	let l:pylintrc_path = getcwd() . '/pylintrc'
	if filereadable(l:pylintrc_path)
		let g:ale_python_pylint_options = '--rcfile=' . l:pylintrc_path
	endif

endfunction

autocmd! User ale call SetupAle()

if exists('g:loaded_ale') && g:loaded_ale
	call SetupAle()
endif
