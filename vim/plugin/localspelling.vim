augroup localspelling

	" Find spell file in cwd
	let g:local_spellfile_path = getcwd() . '/' . &spelllang . '.utf-8.add'

	" Add local spell file to `spellfile`
	" If default spellfile isn't in `spellfile`, add it first
	function SetLocalSpellFile()
		if &spellfile == ''
			silent set spellfile=$HOME/.config/nvim/spell/en.utf-8.add
		endif

		if stridx(&spellfile, g:local_spellfile_path) == -1
			" This is needed to make vim accept a space in a spellfile
			" https://vi.stackexchange.com/questions/27837/how-to-set-spellfile-with-spaces
			" https://github.com/vim/vim/issues/7230
			let l:prev_isfname = &isfname
			execute 'set isfname+=' . char2nr(' ')
			execute 'set spellfile+=' . fnameescape(g:local_spellfile_path)
			let &isfname = l:prev_isfname
		endif

		" Find index of local spell file
		" Usually, global spell file is 1 and local spell file is 2
		" This is used as a "count" to zg / zug
		let g:local_spellfile_index = index(split(&spellfile, ','), g:local_spellfile_path) + 1
	endfunction

	" If project already has local spell file, add it to `spellfile`
	if filereadable(g:local_spellfile_path)
		call SetLocalSpellFile()
	endif

	" Function to add word under cursor to local spell file
	function LocalSpellfileAdd()
		call SetLocalSpellFile()
		execute 'normal ' . g:local_spellfile_index . 'zg'
	endfunction
	nnoremap zl :call LocalSpellfileAdd()<CR>

	" Function to remove word under cursor from local spell file
	function LocalSpellfileRemove()
		call SetLocalSpellFile()
		execute 'normal ' . g:local_spellfile_index . 'zug'
	endfunction
	nnoremap zul :call LocalSpellfileRemove()<CR>
augroup END
