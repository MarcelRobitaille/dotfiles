function! SetupIndentLine()

	" Don't conceal so much in markdown
	let g:indentLine_conceallevel = 1

	" Show markdown backticks
	call matchadd('Conceal', '`', 10, -1, {'conceal': '`'})

	" Enable leading spaces
	let g:indentLine_leadingSpaceEnabled = 1
	let g:indentLine_leadingSpaceChar = '·'

	" Exclude NERDTree
	let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

endfunction

autocmd! User indentLine call SetupIndentLine()

if exists(':IndentLines')
	call SetupIndentLine()
endif
