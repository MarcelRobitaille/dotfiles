function! SetupEmmet()
	let g:user_emmet_expandabbr_key = '<s-tab>'
endfunction

autocmd! user emmet-vim call SetupEmmet()

if g:loaded_emmet_vim
	call SetupEmmet()
endif
