" Change current directory to top of repositories automatically.
" Version: 0.1.0
" Author : scheakur <scheakur@gmail.com>
" License: MIT License

let s:save_cpo = &cpo
set cpo&vim


function! repautocd#cd(names)
	let filepath = expand('%:p')
	if empty(filepath)
		return
	endif
	let dir = s:find_dir(filepath, a:names)
	if empty(dir)
		let dir = expand('$HOME')
	endif
	execute 'lcd' dir
endfunction


function! s:find_dir(find_from, names)
	let dir = fnamemodify(a:find_from, ':h')
	while dir != '/'
		for name in a:names
			if isdirectory(dir . '/' . name)
				return dir
			endif
		endfor
		let dir = fnamemodify(dir, ':h')
	endwhile
	return ''
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
