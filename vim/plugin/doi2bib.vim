function! DOI2BIB()
	" Cut the current line and replace with the result of calling `doi2bib` on it.
	norm [ 
	norm dd
	norm k
	" @ is the unnamed register
	exec 'read ! ~/.dotfiles/bin/doi2bib ' . escape(getreg('@'), '()')
	norm {j$hyiw
endfunction
command! DOI2BIB call DOI2BIB()
