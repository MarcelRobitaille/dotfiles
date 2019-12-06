function! SetupCoC()

	if exists('g:debug_plugin_settings')
		echom 'Loading CoC settings...'
	endif

	" Better display for messages
	set cmdheight=2

	" You will have bad experience for diagnostic messages when it's default 4000.
	set updatetime=300

	" don't give |ins-completion-menu| messages.
	set shortmess+=c

	" always show signcolumns
	set signcolumn=yes

	" Highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

endfunction

if exists(':Coc')
	call SetupCoC()
endif
