function SetupNERDTree()

	if exists('g:debug_plugin_settings')
		echom 'Setting up NERDTree...'
	endif

	" Show hidden files
	let NERDTreeShowHidden = 1

	" Hide "Press ? for help"
	let NERDTreeMinimalUI = 1

	" Use colours not flags
	let g:NERDTreeGitStatusNodeColorization = 1
	let g:NERDTreeGitStatusWithFlags = 0

	" Show files matching .gitignore
	" let g:NERDTreeShowIgnoredStatus = 1

	" Files to be hidden
	let NERDTreeIgnore = ['\.git$', '\.pioenvs$', '\.swp']

	" Folders
	let g:NERDTreeDirArrowExpandable = "\u00a0"
	let g:NERDTreeDirArrowCollapsible = "\u00a0"
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	let g:DevIconsEnableFoldersOpenClose = 1
	let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

	" Use pretty icons
	let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
	let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

	" Prevent brackets around icons when sourcing vimrc
	" if exists('g:loaded_webdevicons')
	" 	call webdevicons#refresh()
	" endif

	" Close NERDTree if it's the only thing left
	" augroup nerdstart
	" 	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	" augroup END

	" Prevent opening files in NERDTree
	" https://github.com/junegunn/fzf/issues/453#issuecomment-366466757

	autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
	autocmd BufWinEnter * call PreventBuffersInNERDTree()

	function! PreventBuffersInNERDTree()
		if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
		\ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
		\ && &buftype == '' && !exists('g:launching_fzf')
		let bufnum = bufnr('%')
		close
		exe 'b ' . bufnum
		endif
		if exists('g:launching_fzf') | unlet g:launching_fzf | endif
	endfunction
endfunction

autocmd! User nerdtree call SetupNERDTree()

if exists(':NERDTree')
	call SetupNERDTree()
endif
