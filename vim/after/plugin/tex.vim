function SetupTex()
	let g:tex_conceal = ''
endfunction

autocmd! User vimtex call SetupTex()

if exists(':Vimtex')
	call SetupTex()
endif
