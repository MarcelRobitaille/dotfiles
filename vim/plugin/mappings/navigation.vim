" Vanilla
" ========================================

" Up and down with set wrap
nmap j gj
nmap k gk

" Quick pane cycling
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ctrl-[pn] -- History search like ZSH
cmap <C-p> <Up>
cmap <C-n> <Down>

" Quickfix navigation
" nnoremap <C-n> :cnext<CR>
" nnoremap <C-p> :cprev<CR>

" `:e`, but relative to current file
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" Shortcut to close only current buffer
nnoremap <leader>q :bn<CR>:bd #<CR>

" Go to nth buffer
let c = 1
while c <= 999
	execute "nnoremap " . c . "<leader> :" . c . "b\<CR>"
	let c += 1
endwhile


" Fuzzy Finder
" ========================================

nnoremap <leader>f <cmd>Telescope find_files hidden=true<cr>
