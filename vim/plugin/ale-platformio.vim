let s:pio_ini = glob("platformio.ini")

let s:ale_pio_env = ''
let s:pio_project_data = {}
let s:pio_ready = 0

" Fail if can't find ini
if empty(s:pio_ini)
	finish
endif

function s:ale_pio_update_env()

	if !s:pio_ready
		echoerr 'Platformio data not yet received and parsed'
		return
	endif

	" Fail if not valid json
	if empty(s:pio_project_data)
		echoerr 'Failed to parse ' . s:pio_ini
		return
	endif

	" Default to first environment
	if s:ale_pio_env == ''
		let s:ale_pio_env = keys(s:pio_project_data)[0]
	endif

	let s:pio_env_data = s:pio_project_data[s:ale_pio_env]

	" -MMD gives the error: permission denied /dev/null.d
	let s:gcc_flags = substitute(s:pio_env_data.cxx_flags, "-MMD", "", "") .
		\ ' ' . join(map(copy(s:pio_env_data.defines), { _, define -> '-D' . define }), ' ') .
		\ ' ' . join(map(
			\ copy(s:pio_env_data.includes.build),
			\ { _, include -> '-I"' . include . '"' }
		\), ' ')

	let g:ale_cpp_gcc_options = s:gcc_flags
	let g:ale_cpp_cc_options = s:gcc_flags

	let g:ale_cpp_cc_executable = s:pio_env_data['cxx_path']
	execute "ALELint"
endfunction

function! ALEPioSetEnv(env)
	let s:ale_pio_env = a:env
	call s:ale_pio_update_env()
endfunction

function! ALEPioUpdate()
	let s:stdout = ''
	let s:stderr = ''

	function! s:on_stderr(job_id, data, event)
		let s:stderr .= join(a:data)
	endfunction

	function! s:on_stdout(job_id, data, event)
		let s:stdout .= join(a:data)
	endfunction

	function! s:on_exit(job_id, exit_code, event)
		if a:exit_code > 0
			echoerr 'Error in ale-platformio: ' . s:stderr
		else
			let s:pio_project_data = json_decode(s:stdout)
			let s:pio_ready = 1
			echom 'ALE Platformio Ready!'
			call s:ale_pio_update_env()
		endif
	endfunction

	let job1 = jobstart(['pio', 'project', 'data', '--json-output'], {
		\ 'on_stdout': function('s:on_stdout'),
		\ 'on_stderr': function('s:on_stderr'),
		\ 'on_exit': function('s:on_exit'),
	\ })
endfunction
call ALEPioUpdate()
