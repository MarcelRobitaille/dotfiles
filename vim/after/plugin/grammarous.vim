function! SetupGrammarous()

	if exists('g:debug_plugin_settings')
		echom 'Setting up Grammarous...'
	endif

	let g:grammarous#languagetool_cmd = '/usr/bin/languagetool'
	let g:grammarous#use_vim_spelllang = 1

	let g:grammarous#disabled_rules = {
		\ 'tex' : ['FR_SPELLING_RULE', 'FRENCH_WHITESPACE'],
		\ }

endfunction

autocmd! User vim-grammarous call SetupGrammarous()

if g:loaded_grammarous
	call SetupGrammarous()
endif
