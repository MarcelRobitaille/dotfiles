function! SetupAle()

	if exists('g:debug_plugin_settings')
		echom 'Setting up ale...'
	endif

	let g:ale_completion_enabled = 0
	let g:ale_disable_lsp = 1

	let g:ale_sign_error = ''
	let g:ale_sign_warning = ''

	function! FixQuotes(buffer) abort
		return {
		\	 'command': "sed -e s/’/\\'/g -e s/–/-/g"
		\}
	endfunction

	execute ale#fix#registry#Add('fixquotes', 'FixQuotes', ['*'], 'Fix quotes')

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
	\ ],
	\ 'markdown': [],
	\ 'html': ['alex', 'angular', 'cspell', 'fecs', 'htmlhint', 'proselint', 'stylelint', 'tidy'],
	\}

	let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace', 'fixquotes'],
	\ 'javascript': ['eslint'],
	\ 'python': ['autopep8', 'isort', 'trim_whitespace'],
	\ 'rust': ['rustfmt'],
	\ 'tex': ['fixquotes', 'latexindent', 'trim_whitespace', 'remove_trailing_lines'],
	\}

	let g:ale_fix_on_save = 1
	let g:ale_fix_on_save_ignore = {
	\ 'python': ['autopep8', 'yapf', 'isort', 'trim_whitespace'],
	\}
	let g:ale_c_parse_makefile = 1
	let g:ale_c_gcc_parse_makefile = 1

	let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

	let l:pylintrc_path = getcwd() . '/pylintrc'
	if filereadable(l:pylintrc_path)
		let g:ale_python_pylint_options = '--rcfile=' . l:pylintrc_path
	endif

	" Mappings
	" ========================================

	" TODO: Try to get used to putting this into quickfix / local list and use much
	" more convenient <C-n> / <C-p>
	nmap <silent> <leader>k <Plug>(ale_previous_wrap)
	nmap <silent> <leader>j <Plug>(ale_next_wrap)

	" <leader>x -- fix file (mnemonic: fi[x])
	nnoremap <leader>x :ALEFix<CR>

endfunction

autocmd! User ale call SetupAle()

if exists('g:loaded_ale') && g:loaded_ale
	call SetupAle()
endif
