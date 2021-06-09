" Mappings
" ========================================

" map <Leader>r to run script
nnoremap <leader>r :IPythonCellRun<CR>

let g:ipython_cell_tag = [ '# %%', '// %%' ]

" map <Leader>e to execute the current cell
augroup marcel_ipython_cell
	autocmd FileType python nnoremap <leader>e :IPythonCellExecuteCell<CR>

	" Cling C++ interpreter (`root` command)
	" Verbose will dump the actual code, which is required for cling
	autocmd FileType cpp nnoremap <leader>e :IPythonCellExecuteCellVerbose<CR>
augroup END
