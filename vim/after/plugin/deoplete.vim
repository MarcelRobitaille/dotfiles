function! SetupDeoplete()
	let g:deoplete#enable_at_startup = 1
endfunction

autocmd! user deoplete.nvim call SetupDeoplete()

if g:loaded_deoplete
	call SetupDeoplete()
endif
