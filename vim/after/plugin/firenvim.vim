let g:firenvim_config = {
	\ 'globalSettings': {
		\ 'alt': 'all',
		\ '<C-w>': 'noop',
	\  },
	\ 'localSettings': {
		\ '.*': {
			\ 'cmdline': 'neovim',
			\ 'content': 'text',
			\ 'priority': 0,
			\ 'selector': 'textarea',
			\ 'takeover': 'always',
		\ },
	\ }
\ }
let fc = g:firenvim_config['localSettings']
let fc['https?://app.element.io'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://www.messenger.com'] = { 'takeover': 'never', 'priority': 1 }

au BufEnter github.com_*.txt set filetype=markdown
