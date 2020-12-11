function Grip()
	! python -m grip --browser "%" $(get-open-port.sh) > grip.log 2>&1 &
endfunction
command! Grip call Grip()
