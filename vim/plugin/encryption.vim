" Transparent editing of gpg encrypted files.
augroup encrypted
	au!
	" First make sure nothing is written to ~/.viminfo while editing
	" an encrypted file.
	autocmd BufReadPre,FileReadPre *.gpg set viminfo=
	" We don't want a swap file, as it writes unencrypted data to disk
	autocmd BufReadPre,FileReadPre *.gpg set noswapfile
	" Switch to binary mode to read the encrypted file
	autocmd BufReadPre,FileReadPre *.gpg set bin
	autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
	autocmd BufReadPre,FileReadPre *.gpg let shsave=&sh
	autocmd BufReadPre,FileReadPre *.gpg let &sh='sh'
	autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
	autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt --default-recipient-self 2> /dev/null
	autocmd BufReadPost,FileReadPost *.gpg let &sh=shsave
	" Switch to normal mode for editing
	autocmd BufReadPost,FileReadPost *.gpg set nobin
	autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
	autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
	" Convert all text to encrypted text before writing
	autocmd BufWritePre,FileWritePre *.gpg set bin
	autocmd BufWritePre,FileWritePre *.gpg let shsave=&sh
	autocmd BufWritePre,FileWritePre *.gpg let &sh='sh'
	autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --encrypt --default-recipient-self 2>/dev/null
	autocmd BufWritePre,FileWritePre *.gpg let &sh=shsave
	" Undo the encryption so we are back in the normal text, directly
	" after the file has been written.
	autocmd BufWritePost,FileWritePost *.gpg silent u
	autocmd BufWritePost,FileWritePost *.gpg set nobin
augroup END
