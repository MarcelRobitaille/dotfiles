	" Mappings
	" ========================================

" <leader>- -- Darken colour under cursor
nnoremap <leader>- color#Test(expand('<cword>'))
						\? '"_ciw' . color#Darken(expand('<cword>')) . "\<Esc>"
						\: "\<Nop>"

" <leader>= -- Lighten colour under cursor
nnoremap <leader>= color#Test(expand('<cword>'))
						\? '"_ciw' . color#Lighten(expand('<cword>')) . "\<Esc>"
						\: "\<Nop>"
