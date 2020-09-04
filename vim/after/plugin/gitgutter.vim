function! SetupGitGutter()

	if exists('g:debug_plugin_settings')
		echom 'Setting up GitGutter...'
	endif

	let g:gitgutter_sign_added='┃'
	let g:gitgutter_sign_modified='┃'
	let g:gitgutter_sign_removed='◢'
	let g:gitgutter_sign_removed_first_line='◥'
	let g:gitgutter_sign_modified_removed='◢'

endfunction

autocmd! User vim-gitgutter call SetupGitGutter()

if exists('g:loaded_gitgutter') && g:loaded_gitgutter
	call SetupGitGutter()
endif
