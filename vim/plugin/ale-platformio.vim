let s:pio_ini = glob("platformio.ini")

" Fail if can't find ini
if empty(s:pio_ini)
  finish
endif

let s:pio_cwd = fnamemodify(s:pio_ini, ':h')
let s:pio_flags_file = s:pio_cwd  . '/.gcc-flags.json'

" Fail if can't find flags file
if empty(glob(s:pio_flags_file))
  echoerr 'Can not find ' . s:pio_flags_file . ' in ' . s:pio_cwd
  finish
endif

" Fail if not valid json
let s:pio_gcc_flags  = json_decode(system('cat ' . s:pio_flags_file))
if empty(s:pio_gcc_flags)
  echoerr 'Failed to parse ' . s:pio_flags_file
  finish
endif

let s:imports = split(s:pio_gcc_flags["gccIncludePaths"], ',')

let g:ale_cpp_gcc_options = s:pio_gcc_flags["gccDefaultCFlags"] . ' -std=gnu++11 -I"' . join(s:imports, '" -I"') . '"'
let g:ale_cpp_gcc_executable = s:pio_gcc_flags["execPath"]
