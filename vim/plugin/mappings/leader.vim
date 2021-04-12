
" Vanilla
" ========================================

" Empty line but don't delete it
nnoremap <leader>dd 0D

" Shortcut to close only current buffer
nnoremap <leader>q :bn<CR>:bd #<CR>


" Fugitive
" ========================================

" <leader>s -- Git status
nnoremap <leader>s :Gstatus<CR>

" <leader>c -- Git commit
nnoremap <leader>c :Gcommit<CR>

" <leader>df -- Git diff (mnemonic: git [d]i[f]f)
nnoremap <leader>df :Gdiff<CR>


" NERDTree
" ========================================

nnoremap <leader>n :NERDTreeToggle<CR>


" Ale
" ========================================

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" <leader>x -- fix file (mnemonic: fi[x])
nnoremap <leader>x :ALEFix<CR>


" Tex
" ========================================

nnoremap <leader>t <Plug>vimtex-compile


" Colorizer
" ========================================

" <leader>- -- Darken colour under cursor
nnoremap <leader>- color#Test(expand('<cword>'))
						\? '"_ciw' . color#Darken(expand('<cword>')) . "\<Esc>"
						\: "\<Nop>"

" <leader>= -- Lighten colour under cursor
nnoremap <leader>= color#Test(expand('<cword>'))
						\? '"_ciw' . color#Lighten(expand('<cword>')) . "\<Esc>"
						\: "\<Nop>"


" IPython
" ========================================

" map <Leader>r to run script
nnoremap <leader>r :IPythonCellRun<CR>

" map <Leader>e to execute the current cell
nnoremap <Leader>e :IPythonCellExecuteCell<CR>
