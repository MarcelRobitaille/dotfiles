function SetupMatchup()
	if exists('g:debug_plugin_settings')
		echom 'Setting up matchup...'
	endif

	let g:matchup_matchparen_deferred = 1
	let g:matchup_matchparen_hi_surround_always = 1
endfunction

if exists('g:loaded_matchup') && g:loaded_matchup
	call SetupMatchup()
endif
