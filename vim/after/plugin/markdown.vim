function SetupMarkdown()
	set conceallevel=0
	let g:vim_markdown_conceal = 0
	let g:vim_markdown_conceal_code_blocks = 0
endfunction

if exists('g:loaded_markdown') && g:loaded_markdown
	call SetupMarkdown()
endif
