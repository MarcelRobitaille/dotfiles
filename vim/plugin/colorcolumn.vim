" Continue comments on next line when max length is reached
set textwidth=80

function! SetColorColumn()
	if exists('+colorcolumn')
		" Highlight columns 1 to textwidth
		let &l:colorcolumn='+' . join(range(1, 254), ',+')
	endif
endfunction
call SetColorColumn()

augroup marcel_colorcolumn
	autocmd!
	" TODO: These are probably too much
	" I went for the shotgun approach
	" Figure out which are actually required
	autocmd BufReadPost,BufNew,ColorScheme,WinEnter * call SetColorColumn()
augroup END
