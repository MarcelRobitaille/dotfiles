let g:firenvim_config = {
	\ 'globalSettings': {
		\ 'ignoreKeys': {
			\ 'all': ['<C-s>', '<C-Enter>'],
		\ },
		\ 'alt': 'all',
		\ '<C-w>': 'noop',
		\ '<C-r>': 'default',
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
let fc['https?://localhost:3030'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://mail.google.com'] = { 'takeover': 'never', 'priority': 1 }
let fc['https?://www.messenger.com'] = { 'takeover': 'never', 'priority': 1 }

au BufWritePost www.overleaf.com_** call firenvim#eval_js('setTimeout(() => document.querySelector(".btn.btn-recompile").click(), 300)')

au BufEnter github.com_*.txt set filetype=markdown

au BufEnter *ipynb* set filetype=python
au BufEnter *ipynb* execute 'ALEDisable'
au BufEnter *ipynb* execute 'LspStop'
au BufRead *ipynb* execute 'LspStop'
au BufReadPost *ipynb* execute 'LspStop'
au BufWritePost *ipynb* call firenvim#eval_js('document.querySelector(`[aria-label="Run"`).click()')
