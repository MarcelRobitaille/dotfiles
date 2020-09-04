function SetupSlime()
	let g:slime_target = "tmux"
	let g:slime_paste_file = tempname()
	let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

	" Fix paste issues in ipython
	let g:slime_python_ipython = 1

	let g:slime_dont_ask_default = 1
endfunction

if exists('g:loaded_slime') && g:loaded_slime
	call SetupSlime()
endif
