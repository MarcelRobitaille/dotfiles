
" Vanilla
" ========================================

" `:e`, but relative to current file
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" Quick pane cycling
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Fuzzy Finder
" ========================================

nnoremap <leader>g :GFiles<CR>
nnoremap <leader>f :Files<CR>


" Commentary
" ========================================

" ctrl-/ -- Comment current line
nmap <C-_> <Plug>CommentaryLine

nmap j gj
nmap k gk
