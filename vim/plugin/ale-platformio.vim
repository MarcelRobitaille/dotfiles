let s:pio_ini = glob("platformio.ini")

" Fail if can't find ini
if empty(s:pio_ini)
	finish
endif

" Fail if not valid json
let s:pio_gcc_flags  = json_decode(system('pio project data --json-output'))
if empty(s:pio_gcc_flags)
	echoerr 'Failed to parse ' . s:pio_flags_file
	finish
endif

" Default to first environment
" TODO
let s:pio_gcc_flags  = values(s:pio_gcc_flags)[0]

let s:gcc_flags = s:pio_gcc_flags.cxx_flags .
	\ ' ' . join(map(copy(s:pio_gcc_flags).defines, { _, define -> '-D' . define }), ' ') .
	\ ' ' . join(map(
		\ copy(s:pio_gcc_flags).includes.build,
		\ { _, include -> '-I"' . include . '"' }
	\), ' ')

let g:ale_cpp_gcc_options = s:gcc_flags
let g:ale_cpp_cc_options = s:gcc_flags

let g:ale_cpp_cc_executable = s:pio_gcc_flags['cxx_path']
