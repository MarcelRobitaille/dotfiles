function! DOI2BIB()
	" Cut the current line and replace with the result of calling `doi2bib` on it.
	norm dd
	" @ is the unnamed register
	exec 'read ! ~/.dotfiles/bin/doi2bib ' . escape(getreg('@'), '()')
endfunction
command! DOI2BIB call DOI2BIB()
