function WriteOrphanedFile()
	silent call mkdir(expand('%:p:h'), 'p')
	w
endfunction
command! WriteOrphanedFile call WriteOrphanedFile()
