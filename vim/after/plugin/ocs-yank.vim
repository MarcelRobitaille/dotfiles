function! SetupOSCYank()
	let g:oscyank_term = 'tmux'
	augroup marcel_ocs_yank
		autocmd!

		if exists('##TextYankPost')
			autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | OSCYankReg + | endif
		endif
	augroup END
endfunction

if exists('g:loaded_oscyank') && g:loaded_oscyank
	call SetupOSCYank()
endif
