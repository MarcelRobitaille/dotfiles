function! GetVisual()
	try
		let v_save = @v
		normal! gv"vy
		return @v
	finally
		let @v = v_save
	endtry
endfunction

function! CenterSelection()
	let v = GetVisual()
	"let l = getline('.')
	let lre = '^\zs\s*\ze\S'
	let rre = '\s*$'
	let sp= matchstr(v,lre)
	let sp .= matchstr(v,rre)
	let ln=len(sp)
	let v = substitute(v,lre,sp[:ln/2-1],'')
	let v = substitute(v,rre,sp[ln/2:],'')
	let ve_save = &virtualedit
	let v_save = @v
	let &virtualedit = 'all'
	call setreg('v', v,visualmode())
	normal! gvx"vP
	let @v = v_save
	let &virtualedit = ve_save
endfunction
command! CenterSelection call CenterSelection()
