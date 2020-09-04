function! SetupIncsearch()

	" Automatically hide results
	let g:incsearch#auto_nohlsearch = 1
	map / <Plug>(incsearch-forward)
	map ? <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay)
	map n <Plug>(incsearch-nohl-n)
	map N <Plug>(incsearch-nohl-N)
	map * <Plug>(incsearch-nohl-*)
	map # <Plug>(incsearch-nohl-#)
	map g* <Plug>(incsearch-nohl-g*)
	map g# <Plug>(incsearch-nohl-g#)

	" Underline search results
	let g:incsearch#highlight = {
	\	 'match' : {
	\		 'group' : 'IncSearchUnderline',
	\		 'priority' : '10'
	\	 },
	\	 'on_cursor' : {
	\		 'priority' : '100'
	\	 },
	\	 'cursor' : {
	\		 'group' : 'Search',
	\		 'priority' : '1000'
	\	 }
	\ }

	"
	" Non-incsearch search settings
	"

	" Highlight results
	set hlsearch

	" Prefer case sensitive matches but allow both
	set ignorecase
	set smartcase

	" Remove search result highlights
	nnoremap <leader>/ :nohl<CR>

endfunction

if exists('g:loaded_incsearch') && g:loaded_incsearch
	call SetupIncsearch()
endif
