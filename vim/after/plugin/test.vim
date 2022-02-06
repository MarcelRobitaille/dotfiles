let test#strategy = 'tslime'
" let test#strategy = 'neomake'
" function MakeGreenStrategy(cmd) abort
"     call MakeGreen(join(split(a:cmd)[1:]))
" endfunction
" let g:test#custom_strategies = {'makegreen': function('MakeGreenStrategy')}
" let g:test#strategy = 'makegreen'
let test#python#runner = 'nose'
" setlocal makeprg=nosetests
" setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
let test#python#nose#options = '--logging-filter=-opentrons'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" augroup test
"   autocmd!
"   autocmd BufWrite * if test#exists() |
"     \   TestNearest |
"     \ endif
" augroup END
